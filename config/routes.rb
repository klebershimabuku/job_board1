JobBoard::Application.routes.draw do

  match '/contact', :to => 'pages#contact'
  match '/about',   :to => 'pages#about'
  match '/help',    :to => 'pages#help'
  match '/home',    :to => 'pages#home'

  resources :jobs

  devise_for :users, :path_names=> { :sign_up => 'register', :sign_in => 'login'}

  root :to => "pages#home"
end
