class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def change_level
    @user = User.find(params[:id]).toggle!(:announcer)
    flash[:notice] = "User level changed!"
    redirect_to users_path
  end
  
end
