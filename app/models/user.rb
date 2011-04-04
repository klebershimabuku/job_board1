class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable,  :lockable and :timeoutable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :announcer, :email, :sign_in_count

  has_many :users
  
  has_one :resume
  
  paginates_per 100
  
  
  def self.request_business(user)
		UserMailer.notify_admin_for_business_request(user).deliver # for admin
		UserMailer.notify_user_for_business_request(user).deliver # for user that are requesting upgrade for business
		find(user[:user_id]).update_attribute(:business_requested, true)
		find(user[:user_id]).update_attribute(:business_requested_at, Time.now)  	
  end
  
  def change_level 	
  	if announcer?
  		update_attribute(:announcer, false)
  	else
  		update_attribute(:announcer, true)
  	end
  end
  
end
