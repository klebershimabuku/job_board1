# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
  user.email                 "foo@example.com"
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

Factory.define :resume do |resume|
	resume.user_id						"1"
	resume.state_id						"1"
	resume.name								"Foo"
	resume.lastname						"Bar"
	resume.birthday						"11/09/1980"
	resume.marital_status			"solteiro(a)"
	resume.address						"Togakushi-mura 1000 Oasa Toyooka 1"
	resume.city								"Nagano-shi"
	resume.phone_number				"090-11112222"
	resume.working						true
	resume.children						2
	resume.possible_moving		true
	resume.qualities					"responsavel, pontual"
	resume.notes							"nao sei japones"
	resume.gender							"masculino"
	resume.height							170
	resume.weight							80
	resume.origin							"brasileiro"
	resume.piercing						false
	resume.tattoo							true
	resume.vehicle						true
	resume.hits								1
end

Factory.define :province do |province|
  province.id               "8"
  province.name             "Shizuoka-ken"
end
