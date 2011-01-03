class Job < ActiveRecord::Base

  validates :title,   :length => { :maximum => 120 }
  validates :content, :length => { :maximum => 250 }

  belongs_to :user
end
