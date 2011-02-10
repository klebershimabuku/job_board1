class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale
  before_filter :reminder
  before_filter :load_pendings

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Acesso Negado."
    redirect_to root_url
  end

  def set_locale
    # if params[:locale] is nil then I18n.default_locale will be used
    I18n.locale = params[:locale]
  end

  private

  def reminder
    if current_user && current_user.admin?
      @pending = Job.all_pending
      @locked = Job.all_locked
    end
  end
  
  def load_pendings
    @user = current_user
    if @user && @user.admin?
      @pending = Job.all_pending
    elsif @user && @user.announcer?
      @pending = Job.user_pending(current_user)
    end  	
  end

end
