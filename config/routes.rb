JobBoard::Application.routes.draw do


  get "user/show"

  match '/contact', :to => 'pages#contact'
  match '/about',   :to => 'pages#about'
  match '/help',    :to => 'pages#help'
  match '/home',    :to => 'pages#home'

  resources :jobs

  devise_for :users, :path_names=> { :sign_up => 'register', :sign_in => 'login'}
  resources :users do
    get :change_level, :on => :member
  end

  root :to => "pages#home"
end
