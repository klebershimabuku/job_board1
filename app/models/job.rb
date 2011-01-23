class Job < ActiveRecord::Base
  require 'twitter'
  require 'rubygems'
  require 'url_shortener'
  
  cattr_reader :per_page
  @@per_page = 10
  
  #attr_accessible :available, :locked, :title, :location, :content, :company_name, :company_website

  validates :title,     :presence => true,    :length => { :maximum => 50 }
  validates :location,  :presence => true
  validates :content,   :presence => true, :length => { :maximum => 1000 }

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

  scope :recents_available, where(:available => 1, :locked => false).order("created_at DESC")
  scope :user_pending, lambda { |user|
    where("jobs.available = 0 AND jobs.user_id = ?", user.id)
  }
  scope :all_pending, where(:available => 0)
  scope :all_locked,  where(:locked => true)
  scope :feed,        where(:available => 1, :locked => false, :order => 'created_at DESC')
  
  def tweet(url)
    Twitter.configure do |config|
      config.consumer_key = APP_CONFIG['twitter_consumer_key']
      config.consumer_secret = APP_CONFIG['twitter_consumer_secret']
      config.oauth_token = APP_CONFIG['twitter_access_token']
      config.oauth_token_secret = APP_CONFIG['twitter_secret_token']
    end    
    authorize = UrlShortener::Authorize.new APP_CONFIG['bit_ly_id'], APP_CONFIG['bit_ly_api_key']
    client = UrlShortener::Client.new authorize
    shorten_url = client.shorten(url).urls
    Twitter.update("#{title} - #{shorten_url}")
  end
  
end
