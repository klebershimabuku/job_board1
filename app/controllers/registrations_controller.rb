# encoding: utf-8
class RegistrationsController < Devise::RegistrationsController
  def create
    build_resource
    if resource.save
      redirect_to signup_successful_path
    else
      clean_up_passwords(resource)
      flash[:alert] = "Código da imagem incorreto. Por favor tente novamente."
      render_with_scope :new
    end
  end
    
  def success
  end
    
  
end