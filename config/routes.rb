JobBoard::Application.routes.draw do

  match '/oauth/authorize', :controller => 'oauth', :action => 'start', :as => :oauth_authorize
  match '/oauth/callback', :controller => 'oauth', :action => 'callback', :as => :oauth_callback

  match '/contact', :to => 'pages#contact'
  match '/about',   :to => 'pages#about'
  match '/help',    :to => 'pages#help'
  match '/home',    :to => 'pages#home'
  match '/partner/dekapower', :to => 'pages#dekapower'

  match '/jobs/revision', :to => 'jobs#revision'
  match '/jobs/locked', :to => 'jobs#locked'
  resources :jobs do
    get :publish, :on => :member
    get :unpublish, :on => :member
    get :lock, :on => :member
    get :unlock, :on => :member
  end

  devise_for :users, :path_names=> { :sign_up => 'register', :sign_in => 'login'}
  resources :users do
    get :change_level, :on => :member
  end

  root :to => "pages#home"
end
