class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale
  before_filter :reminder
  before_filter :load_pendings
  before_filter :prepare_for_mobile
  

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Acesso Negado."
    redirect_to root_url
  end
  
  def prepare_for_mobile
    session[:mobile_param] = params[:mobile] if params[:mobile]
    request.format = :mobile if mobile_device?
  end

  def mobile_device?
    if session[:mobile_param]
      session[:mobile_param] == "1"
    else
      request.user_agent =~ /Mobile|webOS/
    end
  end
  
  def browser_is? query
      query = query.to_s.strip.downcase
      result = case query
      when /^ie(\d+)$/
        ua.index("msie #{$1}") && !ua.index('opera') && !ua.index('webtv')
      when 'ie'
        ua.match(/msie \d/) && !ua.index('opera') && !ua.index('webtv')
      when 'yahoobot'
        ua.index('yahoo! slurp')
      when 'mozilla'
        ua.index('gecko') || ua.index('mozilla')
      when 'webkit'
        ua.match(/webkit|iphone|ipad|ipod/)
      when 'safari'
        ua.index('safari') && !ua.index('chrome')
      when 'ios'
        ua.match(/iphone|ipad|ipod/)
      when /^robot(s?)$/
        ua.match(/googlebot|msnbot/) || browser_is?('yahoobot')
      when 'mobile'
        browser_is?('ios') || ua.match(/android|webos|mobile/)
      else
        ua.index(query)
      end
      not (result.nil? || result == false)
  end
  
  def ua
      @ua ||= begin
        request.env['HTTP_USER_AGENT'].downcase
      rescue
        ''
      end
    end

  def set_locale
    # if params[:locale] is nil then I18n.default_locale will be used
    # I18n.locale = params[:locale]
    I18n.locale = 'pt-BR'
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
    
  helper_method :mobile_device?, :browser_is?

end
