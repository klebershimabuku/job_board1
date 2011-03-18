#encoding: utf-8
class UsersController < ApplicationController
  load_and_authorize_resource
  def index
    @users = User.page params[:page]
  end

  def change_level
    @user = User.find(params[:id])
    @user.change_level
    flash[:notice] = "User level changed!"
    redirect_to users_path
  end
  
  def dashboard
  	@active_pack = Account.find_by_user_id(current_user)
  	@announcer_total_jobs = Job.announcer_total_jobs(current_user)
  	
  	if @active_pack.blank?
  		flash[:error] = "Entre em contato com o Administrador para definir um plano de anúncios."
  		redirect_to(root_path)
  	end
  end
  
  def show
  	@user = User.find(params[:id])
  	@account = Account.find_by_user_id(params[:id])
  end


end
