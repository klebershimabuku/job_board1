class PagesController < ApplicationController
  def home
    @title = "Home"
  end

  def contact
    @title = "Contato"
  end

  def about
    @title = "Sobre"
  end

  def help
    @title = "Ajuda"
  end
  
  def dekapower
    @dekapower_job = Dekapower.find(params[:id])
    clicks = @dekapower_job.clicks
    @dekapower_job.update_attribute("clicks", clicks+1)
    redirect_to @dekapower_job.url
  end

end
