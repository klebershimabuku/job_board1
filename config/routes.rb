JobBoard::Application.routes.draw do
  get "pages/home"

  get "pages/contact"

  get "pages/about"

  get "pages/help"

  resources :jobs

  devise_for :users

  root :to => "user#index"
end
