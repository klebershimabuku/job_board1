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
			can [:read, :list], Resume
      cannot [:manage, :approve, :list], Comment
    else
      can [:read,:feed,:batatafeeds], Job
	    can [:read, :info], [Agency]
	    can [:read, :new, :create], Resume

      cannot [:manage, :approve, :list], Comment
			cannot [:read, :list], Resume

      can [:read, :update, :destroy], Resume do |resume|
      	resume.try(:user) == user
      end

    end
    
  end
    
end