 atom_feed(:language => "pt-BR") do |feed|
  feed.title(h "ShigotoDoko")
  feed.updated((@jobs.first.created_at))
  for job in @jobs
    feed.entry(job) do |entry|
      entry.title("(#{job.location}) - " + "#{job.title}")
      entry.content(job.content, :type => 'html')
      entry.author do |author|
        author.name(h "http://www.shigotodoko.com")
      end
    end
  end


end
