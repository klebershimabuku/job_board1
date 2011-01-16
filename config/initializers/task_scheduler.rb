require 'rubygems'
require 'rufus/scheduler'
require 'feedzirra'

scheduler = Rufus::Scheduler.start_new

#scheduler.every '1m' do
scheduler.cron '0 0 * * * Asia/Tokyo' do
  job_ids = Job.where("created_at < ? AND locked = ?", 30.days.ago, false)
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

#scheduler.every '1m' do
scheduler.cron '0 0 * * * Asia/Tokyo' do
  feed = Feedzirra::Feed.fetch_and_parse("http://dekapower.blogspot.com/feeds/posts/default")
  entry = feed.entries.first
  last_published_post = entry.published.to_datetime
  post = Dekapower.where("published = ?", last_published_post).order("created_at DESC")
  puts "Was founded #{post.size} posts on the database."
  if post.size > 0 # it's already updated
    # do nothing
    puts "No new posts. Waiting.. maybe tomorrow?"
  else
    # add 3 last entries
    puts "Start to save to db.."
    entries = feed.entries
    entries.inspect
    entries.first(3).each do |post|
      puts "saving #{post.title}"
      Dekapower.create!(:title => post.title, :content => post.content, :url => post.url, :published => post.published, :updated => post.updated, :clicks => 0)
    end
  end
end
