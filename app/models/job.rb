class Job < ActiveRecord::Base

  validates :title,   :length => { :maximum => 120 }
  validates :content, :length => { :maximum => 1000 }

  belongs_to :user

  scope :recents_available, where(:available => 1).order("created_at DESC")
  scope :user_pending_jobs, lambda { |user|
    where("jobs.available = 0 AND jobs.user_id = ?", user.id)
  }
  scope :all_pending_jobs, where(:available => 0)
end
