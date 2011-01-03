JobBoard::Application.routes.draw do

  match '/contact', :to => 'pages#contact'
  match '/about',   :to => 'pages#about'
  match '/help',    :to => 'pages#help'
  match '/home',    :to => 'pages#home'

  resources :jobs

  devise_for :users

  root :to => "pages#home"
end
