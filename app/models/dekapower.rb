class Dekapower < ActiveRecord::Base
  scope :recents, order("created_at DESC") 
end
