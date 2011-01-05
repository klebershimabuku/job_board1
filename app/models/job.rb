class Job < ActiveRecord::Base

  validates :title,   :length => { :maximum => 120 }
  validates :content, :length => { :maximum => 1000 }

  URL_REGEX = /(ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/
  validates :company_website, :format => URL_REGEX

  validates :how_to_apply, :length => { :maximum => 160 }

  belongs_to :user

  scope :recents_available, where(:available => 1).order("created_at DESC")
  scope :user_pending_jobs, lambda { |user|
    where("jobs.available = 0 AND jobs.user_id = ?", user.id)
  }
  scope :all_pending_jobs, where(:available => 0)
end
