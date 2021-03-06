class Comment < ActiveRecord::Base

  include ActsAsCommentable::Comment

  belongs_to :commentable, :polymorphic => true

  default_scope :order => 'created_at ASC'
  
  scope :list , :order => 'created_at DESC'
  
  scope :pending_authorization, where(:approved => false)

  # NOTE: install the acts_as_votable plugin if you
  # want user to vote on the quality of comments.
  #acts_as_voteable

  # NOTE: Comments belong to a user
  belongs_to :user
  
  validates_presence_of :title
  validates_presence_of :comment
  
  def approve!
  	update_attribute(:approved,true)
  end 
  
end
