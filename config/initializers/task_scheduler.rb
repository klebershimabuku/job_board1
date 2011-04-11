require 'rubygems'
require 'rufus/scheduler'


scheduler = Rufus::Scheduler.start_new

#scheduler.every '1m' do
scheduler.cron '0 0 * * * Asia/Tokyo' do
  job_ids = Job.where("created_at < ? AND locked = ?", 60.days.ago, false)
    if job_ids.size > 0
      job_ids.each do |job|
        puts "Locking: #{job.title}.."
        job.update_attribute("locked", true)
      end     
      puts "#{job_ids.size} jobs have been locked."
    else
      puts "No job to lock. Still waiting.."
    end
end

scheduler.cron '0 0 1 * * * Asia/Tokyo' do
	system("rake RAILS_ENV=production sitemap:refresh")
end
