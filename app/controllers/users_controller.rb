#encoding: utf-8
class UsersController < ApplicationController
  load_and_authorize_resource
  layout "admin"
  
  def index
    @search = User.search params[:search]
    @users = @search.page params[:page]   
  end
  
  def edit
  	@user = User.find(params[:id])
  end
  
  def update
  	if @user.update_attributes(params[:user])
  		flash[:alert] = "Dados alterados com sucesso"
  		redirect_to users_path
  	else
  		flash[:error] = "Não foi possivel salvar as modificações."  	
  		render 'edit'
  	end
  end
  
  def destroy
  	@user = User.find(params[:id])
  	@user.destroy
 		redirect_to(users_path, :notice => "Usuário excluído com sucesso.") 		
  end

  def change_level
    @user = User.find(params[:id])
    @user.change_level
    flash[:notice] = "User level changed!"
    redirect_to user_path(@user)
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
