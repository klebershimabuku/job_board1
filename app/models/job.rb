class Job < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 10
  
  attr_accessible :available, :locked

  validates :title,     :presence => true,    :length => { :maximum => 50 }
  validates :location,  :presence => true
  validates :content,   :presence => true, :length => { :maximum => 1000 }

  URL_REGEX = /(ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/
  validates :company_website, :format => URL_REGEX
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
  
end
