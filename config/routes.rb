JobBoard::Application.routes.draw do

  match '/oauth/authorize', :controller => 'oauth', :action => 'start', :as => :oauth_authorize
  match '/oauth/callback', :controller => 'oauth', :action => 'callback', :as => :oauth_callback

  match '/contact', :to => 'pages#contact'
  match '/about',   :to => 'pages#about'
  match '/help',    :to => 'pages#help'
  match '/home',    :to => 'pages#home'
  match 'help/how-to-start-ad', :to => 'pages#how_to_start_ad', :as => 'how_to_start_ad'
  match '/business-request', :to => 'pages#business_request', :as => 'business_request'
  match '/dashboard', :to => 'users#dashboard', :as => 'dashboard'

  match '/jobs/revision', :to => 'jobs#revision'
  match '/jobs/locked', :to => 'jobs#locked'
  resources :jobs do
    get :publish, :on => :member
    get :unpublish, :on => :member
    get :lock, :on => :member
    get :unlock, :on => :member
    get :expired, :on => :member
  end

  devise_for :users, :path_names=> { :sign_up => 'register', :sign_in => 'login'}
  resources :users do
    get :change_level, :on => :member
    get :dashboard, :on => :member
  end

	resources :companies do
		get :in, :on => :member, :path => 'list'
		resources :comments
	end
	
	resources :provinces
	resources :accounts do
		get :free, :on => :member
		get :special, :on => :member
	end
	
		
	
  root :to => "pages#home"
end
