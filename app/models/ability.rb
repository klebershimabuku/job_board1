class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new # guest user

    if user.admin?
      can :manage, :all
    elsif user.announcer?
      can [:read, :create, :new, :revision], Job
      can :update, Job do |job|
        job.try(:user) == user 
      end
    else
      can :read, [Job]
    end
  end

  
end