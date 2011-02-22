class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new # guest user

    if user.admin?
      can :manage, :all
    elsif user.announcer?
      #can [:read, :create, :new, :revision], Job
      
      ###########
      #
      # any announcer can read the jobs
      # in order an account represents a job pack, so, every purchase will generate a new account
      #
      ############
      can :read, Job
      
      
      # check if the announcer has any pack plan assigned
      account = Account.find_by_user_id(user)
      
      # ensure that the announcer has acquired any job pack
      if !account.active_pack.nil? || !account.active_pack.blank?
	      ####
	      #
	      # here go the roles for all type of packs
	      # available types: free, special
	      #
	      #######

				########
				#
				# roles for free
				#
				########
				if account.active_pack == 'free'
					
					posts_limit = 999
					
					# check if posts limit exceed
					allow_or_not_new_jobs(account, posts_limit)
          can :dashboard, User
          
          
        ############
        #
        # roles for standard
        #
        #############
    		elsif account.active_pack == 'special' || account.active_pack == 'admin'
          
          posts_limit = 999
          
          # check if posts limit exceed
          allow_or_not_new_jobs(account, posts_limit)
          can :dashboard, User



          
				end
        
				
      end
      
      # the announcer can only updates and access revision for the jobs that they owns
      can [:update, :revision], Job do |job|
        job.try(:user) == user 
      end
    else
      can :read, [Job]
    end
  end
  
  def allow_or_not_new_jobs(account, posts_limit)
		new_posts_allowed = Job.allowed?(account, posts_limit)
		
		if new_posts_allowed
      can [:create, :new], Job											
		else
			can :revision, Job
      cannot [:create, :new], Job             
		end
  end
  

  
end