# coding: utf-8
class PagesController < ApplicationController
	caches_page :home, :contact, :about, :help

  def home
  end

  def contact
  end

  def about
  end

  def help
  end
  
  def info
  	@prefectures = Prefecture.all(:include => :province)
  end
  
  def how_to_start_ad; end
  
  def business_request
  	if current_user.nil?
  		flash[:error] = "Você precisa estar logado para acessar esta página."
  		redirect_to root_path	
  	end
  	
		if request.post?
      @user = params[:business]
      @assunto = 'Business Upgrade Request'
			
			if params[:business]['company_name'].blank? || params[:business]['user_phone'].blank? || params[:business]['user_name'].blank? || params[:business]['user_position'].blank?
			  flash[:error] = "Preencha os campos corretamente."
			  redirect_to business_request_path
			else
				User.request_business(@user)
				flash[:notice] = "Solicitação enviada com sucesso!" # notify successful send
				redirect_to home_path # or wherever you wanna go
			end
		end
	end
	
	def busca; end
	
end
