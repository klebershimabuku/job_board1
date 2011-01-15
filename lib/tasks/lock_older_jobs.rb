class LockOlderJobs < ActiveRecord::Base
  
  # This script will change the "locked" attribute from jobs table from FALSE to TRUE.
  
  job_ids = Job.where("created_at < ?", 30.days.ago)
  
  if job_ids.size > 0
    job_ids.each do |job|
      job.change_attribute("locked", false)
    end     
    puts "#{job_ids.size} jobs have been locked."
  end
end