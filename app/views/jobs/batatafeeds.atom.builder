 atom_feed(:language => "pt-BR") do |feed|
  feed.title(h "ShigotoDoko")
  feed.updated((@jobs.first.created_at))
  for job in @jobs
    feed.entry(job) do |entry|
      entry.title(job.title)
      description = '<br />Mais informações acesse http://www.shigotodoko.com'
      entry.content(description, :type => 'html')
      entry.author do |author|
        author.name(h "http://www.shigotodoko.com")
      end
    end
  end


end
