class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new # guest user

    if user.admin?
      can :manage, :all
    elsif user.announcer?
    	can [:dashboard], User
      can [:read, :create, :new], Job
      can [:update, :revision], Job do |job|
        job.try(:user) == user 
      end
      
      cannot [:manage, :approve], Comment
    else
      can :read, [Job]
      cannot [:manage, :approve], Comment
    end
    
    # all users (guests, announcers, etc.)
    can [:read, :info], [Agency]
    can [:feed, :batatafeeds], [Job]
  end
    
end