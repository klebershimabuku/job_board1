# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.shigotodoko.com"

SitemapGenerator::Sitemap.add_links do |sitemap|
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: sitemap.add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  # 
  # 
  # Examples:
  # 
  # Add '/articles'
  #   
  #   sitemap.add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add individual articles:
  #
  #   Article.find_each do |article|
  #     sitemap.add article_path(article), :lastmod => article.updated_at
  #   end
  sitemap.add '/home'
  sitemap.add '/about'
  sitemap.add '/help'
  sitemap.add '/contact'
  sitemap.add '/agencias-hello-work'
  sitemap.add '/agencias-hello-work/info'
  
  # add /vagas
  sitemap.add jobs_path, :priority => 0.7, :changefreq => 'daily'

  Job.find_each do |job|
  	if job.available && !job.locked
  		sitemap.add job_path(job), :lastmod => job.updated_at
  	end
  end
  
  # add /empresas
  sitemap.add companies_path, :priority => 0.3
	
	Company.find_each do |company|
		sitemap.add company_path(company), :lastmod => company.updated_at
	end
  
  # add /provinces
  sitemap.add provinces_path, :priority => 0.3
  
  # add /agencies
  sitemap.add agencies_path, :priority => 0.3
  
end