class Job < ActiveRecord::Base

  validates :title,     :presence => true,    :length => { :maximum => 50 }
  validates :location,  :presence => true
  validates :content,   :presence => true, :length => { :maximum => 1000 }

  URL_REGEX = /(ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/
  validates :company_website, :format => URL_REGEX
  validates :company_name, :presence => true

  validates :how_to_apply, :presence => true, :length => { :maximum => 160 }

  belongs_to :user

  scope :recents_available, where(:available => 1).order("created_at DESC")
  scope :user_pending_jobs, lambda { |user|
    where("jobs.available = 0 AND jobs.user_id = ?", user.id)
  }
  scope :all_pending_jobs, where(:available => 0)
end
