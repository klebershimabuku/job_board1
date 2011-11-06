require 'rubygems'
require 'rufus/scheduler'


scheduler = Rufus::Scheduler.start_new

#scheduler.every '1m' do
scheduler.cron '0 0 * * * Asia/Tokyo' do
  job_ids = Job.where("created_at < ? AND locked = ? AND highlight = ?", 60.days.ago, false, nil)
    if job_ids.size > 0
      job_ids.each do |job|
        puts "Locking: #{job.title}.."
        job.update_attribute("locked", true)
      end     
      puts "#{job_ids.size} jobs have been locked."
    else
      puts "No job to lock. Still waiting.."
    end
    
  sponsored_jobs = Job.where("published_at < ? AND locked = ? AND highlight = ?", 45.days.ago, false, true)
  if sponsored_jobs.size > 0 
    sponsored_jobs.each do |job|
      puts "Locking: #{job.title} due 45 limit expiration."
      UserMailer.job_system_locked_notification(job).deliver
      job.update_attribute("locked", true)
    end
  else
    puts "No sponsored jobs to lock at this time."
  end
  
  
end