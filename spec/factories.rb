# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
  user.email                 "mhartl@example.com"
  user.password              "foobar"
  user.password_confirmation "foobar"
  user.admin                 "0"
  user.announcer             "0"
  user.id                    "1"
  #user.association           :job
end

Factory.define :admin_user do |user|
  user.email                 "admin@example.com"
  user.password              "foobar"
  user.password_confirmation "foobar"
  user.admin                 "1"
  user.announcer             "0"
end

Factory.define :announcer_user do |user|
  user.email                 "admin@example.com"
  user.password              "foobar"
  user.password_confirmation "foobar"
  user.admin                 "0"
  user.announcer             "1"
end

Factory.define :job do |job|
  job.title                 "Contrata-se para fabrica de autos"
  job.content               "Estamos contratando pessoas interessadas em trabalhar em fabrica de autos"
  job.location              "Aichi-ken, Toyohashi-shi"
  job.company_name          "K.K. Test"
  job.company_website       "http://www.test.com"
  job.how_to_apply          "Enviar email para contato@test.com"
  job.user_id               "1"
  job.account_id            "1"
end

Factory.define :account do |account|
  account.active_pack       "free"
  account.valid_start_at    Time.now
  account.valid_end_at      Time.now + 1.year
  account.user_id           "1"
end