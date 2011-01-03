JobBoard::Application.routes.draw do
  resources :jobs

  devise_for :users

  root :to => "user#index"
end
