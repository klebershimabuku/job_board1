class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale
  before_filter :reminder

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

end
