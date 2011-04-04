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
			can :read, Resume
      cannot [:manage, :approve], Comment
    else
      can [:read,:feed,:batatafeeds], Job
	    can [:read, :info], [Agency]

      cannot [:manage, :approve], Comment
      cannot [:read], Resume

      can [:update, :destroy], Resume do |resume|
      	resume.try(:user) == user
      end

    end
    
  end
    
end