class Job < ActiveRecord::Base

  validates :title,   :length => { :maximum => 120 }
  validates :content, :length => { :maximum => 1000 }

  belongs_to :user

  scope :recents, :order => 'id DESC'
end
