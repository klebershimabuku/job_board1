ActionMailer::Base.smtp_settings = {
  :address  => "mail.shigotodoko.com",
  :port  => 25,
  :domain  => "shigotodoko.com",
  :user_name  => "alert@shigotodoko.com",
  :password  => "pqlamz09085166027",
  :authentication  => :login
}
  
ActionMailer::Base.default_url_options[:host] = 'localhost:3000'