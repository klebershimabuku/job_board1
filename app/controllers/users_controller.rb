class UsersController < ApplicationController
  load_and_authorize_resource
  def index
    @users = User.all
  end

  def change_level
    @user = User.find(params[:id]).update_attribute(:announcer, true)
    flash[:notice] = "User level changed!"
    redirect_to users_path
  end
  
  def dashboard
  	@active_pack = Account.find_by_user_id(current_user)
  	@announcer_total_jobs = Job.announcer_total_jobs(current_user)
  end


end
