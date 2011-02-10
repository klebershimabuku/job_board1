class UserMailer < ActionMailer::Base
  default :from => "\"ShigotoDOKO\" <alert@shigotodoko.com>", :to => "\"Kleber Shimabuku\" <klebershimabuku@gmail.com>", :bcc => "\"Administrador ShigotoDOKO\" <admin@shigotodoko.com>"
  
  # notify the announcer about the successful post with a nice message about the previous admin approval.
  def job_posted_announcer_notification(job)
    @job = job
    @user = User.find(@job.user_id)
    mail(:subject => "Anuncio enviado com sucesso.", :to => @user.email)# for announcer and a hide copy to admin
  end
  
  def job_updated(job)
    @job = job
    @user = User.find(@job.user_id)
    mail(:subject => "#{job.company_name} has updated #{job.title}")
  end
  
  def new_user_registered(user)
    mail(:subject => "#{user.email} has sign-up.")
  end
  
  def notify_admin_for_business_request(user)
  	@user = user
  	mail(:subject => "Business Upgrade requested")  	
  end
  
  def notify_user_for_business_request(user)
  	@user = user
  	mail(:subject => "Business Upgrade requested", :to => @user['user_email'])
  end
end
