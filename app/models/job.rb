class Job < ActiveRecord::Base
  require 'twitter'
  require 'rubygems'
  require 'url_shortener'
    
  cattr_reader :per_page
  @@per_page = 10
  
  #attr_accessible :available, :locked, :title, :location, :content, :company_name, :company_website

  validates :title,     :presence => true,    :length => { :maximum => 50 }
  validates :location,  :presence => true
  validates :content,   :presence => true, :length => { :maximum => 2000 }

  URL_REGEX = /^(https?|ftp):\/\/(?#                                      protocol
              )(([a-z0-9$_\.\+!\*\'\(\),;\?&=-]|%[0-9a-f]{2})+(?#         username
              )(:([a-z0-9$_\.\+!\*\'\(\),;\?&=-]|%[0-9a-f]{2})+)?(?#      password
              )@)?(?#                                                     auth requires @
              )((([a-z0-9][a-z0-9-]*[a-z0-9]\.)*(?#                       domain segments AND
              )[a-z][a-z0-9-]*[a-z0-9](?#                                 top level domain  OR
              )|((\d|[1-9]\d|1\d{2}|2[0-4][0-9]|25[0-5])\.){3}(?#
                  )(\d|[1-9]\d|1\d{2}|2[0-4][0-9]|25[0-5])(?#             IP address
              ))(:\d+)?(?#                                                port
              ))(((\/+([a-z0-9$_\.\+!\*\'\(\),;:@&=-]|%[0-9a-f]{2})*)*(?# path
              )(\?([a-z0-9$_\.\+!\*\'\(\),;:@&=-]|%[0-9a-f]{2})*)(?#      query string
              )?)?)?(?#                                                   path and query string optional
              )(#([a-z0-9$_\.\+!\*\'\(\),;:@&=-]|%[0-9a-f]{2})*)?(?#      fragment
              )$/i
  validates :company_website, :format => URL_REGEX, :if => :company_website?
  validates :company_name, :presence => true

  validates :how_to_apply, :presence => true, :length => { :maximum => 160 }

  belongs_to :user

  scope :recents_available, where(:available => true, :locked => false).order("created_at DESC")
  scope :user_pending, lambda { |user|
    where("jobs.available = 0 AND jobs.expired = 0 AND jobs.user_id = ?", user.id)
  }
  scope :all_pending, where(:available => 0, :locked => false)
  scope :all_locked,  where(:locked => true)
  scope :feed,        where(:available => 1, :locked => false, :order => 'created_at DESC')
   
  attr_accessible :title, :content, :location, :company_name, :company_website, :how_to_apply, :available, :locked, :user_id, :account_id, :published_at, :campaign_start_at, :campaign_end_at, :expired, :expired_at, :highlight
 
 	def to_param
    #"#{id}-#{title.downcase.gsub(/[^[:alnum:]]/,'-')}".gsub(/-{2,}/,'-')
    "#{id}-#{title.downcase.parameterize}"
	end
	
  def tweet(url)
    Twitter.configure do |config|
      config.consumer_key = APP_CONFIG['twitter_consumer_key']
      config.consumer_secret = APP_CONFIG['twitter_consumer_secret']
      config.oauth_token = APP_CONFIG['twitter_access_token']
      config.oauth_token_secret = APP_CONFIG['twitter_secret_token']
    end    
    shorted_url = shorten_url(url)
    Twitter.update("#{title} - #{shorted_url}")
  end

  def facebook_it(url)
    pages = FbGraph::User.me(APP_CONFIG['facebook_access_token']).accounts.first
    shorten_url = shorten_url(url)
    pages.feed!(
        :message => "#{title}",
        :link => shorten_url,
        :description => "#{content[0..280]}"
    )
  end

  def share(url)
    #tweet(url)
    #facebook_it(url)
  end

  def shorten_url(url)
    authorize = UrlShortener::Authorize.new APP_CONFIG['bit_ly_id'], APP_CONFIG['bit_ly_api_key']
    client = UrlShortener::Client.new authorize
    shorten_url = client.shorten(url).urls
  end
  
  def publish
  	class << self
  		def record_timestamps; false; end
  	end
    update_attributes(:available => true, :published_at => Time.now) if !locked?
    
    ####
    # 
    # set campaign_start_at and campaign_end_at properly 
    #
    ####
    pack = active_pack
    if pack == 'free'
			update_attributes(:campaign_start_at => Time.now, :campaign_end_at => Time.now + 30.days)
		elsif pack == 'special' || pack == 'admin'
			update_attributes(:campaign_start_at => Time.now, :campaign_end_at => Time.now + 45.days)
		end    
  	class << self
  		remove_method :record_timestamps
  	end
    
  end
  
  def active_pack
    Account.find(account_id).active_pack
  end
  
  def unpublish
    update_attribute(:available, false)
  end

  def lock
    update_attributes(:locked => true, :available => false)
    logger.debug "#{self.title} has been locked."
  end

  def unlock
    update_attributes(:locked => false, :available => false)
  end
  
  def increase_pagehit
  	class << self
  		def record_timestamps; false; end
  	end
		if available?
    	self.increment! :visits
      self.check_max_pagehits
  	end
  	class << self
  		remove_method :record_timestamps
  	end
  end
  
  def check_max_pagehits
    logger.debug 'checking max page hits..'
    pack = active_pack
    logger.debug 'checking pack.. ' + pack
    case pack
    when 'free'
      max_pagehits = 500
      if visits > max_pagehits
      	lock
      	expire!
      end
    when 'special'
      max_pagehits = 100000
      if visits > max_pagehits
      	lock 
      	expire!
      end
    end
  end

  def expire!
    update_attributes(:expired => true, :expired_at => Time.now)
  end
  
  
  def self.allowed?(account_id, limit)
		posts = where(:account_id => account_id)
		if posts.count < limit
			true
		else
			false
		end
  end

  def self.announcer_total_jobs(user_id)
    where(:user_id => user_id).order('id desc')
  end

  def self.published
    where(:available => true, :locked => false)
  end

  def self.revision
    where(:available => false, :locked => false)
  end

  def self.expired
    where(:expired => true)
  end
  
  def self.total_account_highlight(account_id)
  	where(:account_id => account_id).count
  end
  
  def self.allow_highlight?(account)
  	account_type = Account.find(account).active_pack
  	logger.debug "#{account_type}"
  	allowed = APP_CONFIG['accounts']["#{account_type}"]['highlight_jobs']
  	if total_account_highlight(account) > allowed
  		true
  	else
  		false
  	end
  end

	def visits_average(option={})
		if option == 'day'
			days_passed = Date.today - published_at.to_date
			(visits / days_passed.to_f).to_i
		end
	end
end
