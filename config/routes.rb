JobBoard::Application.routes.draw do

  resources :prefectures
  
  resources :resumes, :path => 'curriculos' do
  	collection do
  		get :list
  	end
  end

  match '/oauth/authorize', :controller => 'oauth', :action => 'start', :as => :oauth_authorize
  match '/oauth/callback', :controller => 'oauth', :action => 'callback', :as => :oauth_callback

  match '/contact', :to => 'pages#contact'
  match '/about',   :to => 'pages#about'
  match '/help',    :to => 'pages#help'
  match '/pages/info', :to => 'pages#info'
  match '/home',    :to => 'pages#home'
  match '/busca', :to => 'pages#busca'
  
  match '/batatafeeds', :to => 'jobs#batatafeeds', :format => :atom  
  match '/feed', :to => 'jobs#feed', :format => :atom  
 
  match 'help/how-to-start-ad', :to => 'pages#how_to_start_ad', :as => 'how_to_start_ad'
  match 'help/por-que-anunciar-no-shigotodoko', :to => 'pages#why_to_announce', :as => 'why_to_announce'
  match '/business-request', :to => 'pages#business_request', :as => 'business_request'
  match '/business-request/success', :to => 'pages#business_request_success', :as => 'business_request_success'
  match '/dashboard', :to => 'users#dashboard', :as => 'dashboard'
	match '/dashboard/comments/manager', :to => 'comments#manager', :as => 'comments_manager'
	
  match '/jobs/revision', :to => 'jobs#revision'
  match '/jobs/locked', :to => 'jobs#locked'
  
  resources :jobs, :path => 'vagas' do
    get :publish, :on => :member
    get :unpublish, :on => :member
    get :lock, :on => :member
    get :unlock, :on => :member
    get :expired, :on => :member
  end

  devise_for :users, :controllers => { :registrations => "registrations" }

  devise_scope :users do
    get '/login', :to => 'devise/sessions#new'
    get '/register', :to => 'devise/registrations#new'
    get '/logout', :to => 'devise/sessions#destroy'
    get '/signup-successful', :to => 'devise/registrations#success', :as => 'signup_successful'
  end
  
  resources :users do
    get :change_level, :on => :member
    get :dashboard, :on => :member
  end

	resources :comments, :path => 'comentarios' do
		get :approve, :on => :member
		collection do
		  get :list
		end
	end
	
	
	resources :companies, :path => 'empresas' do
		get :in, :on => :member, :path => 'list'
		resources :comments
	end
	
	resources :provinces
	resources :accounts do
		get :free, :on => :member
		get :special, :on => :member
	end

	match 'agencias-hello-work/info', :to => 'agencies#info', :as => 'info_agencies'	
	resources :agencies, :path => 'agencias-hello-work'
	
  root :to => "pages#home"
end
