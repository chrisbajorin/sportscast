Rails.application.routes.draw do
  get 'welcome/index'

  # root "welcome#index"
  root "users#new"

  resources :baseballs, :only => [:index, :show]
  resources :footballs, :only => [:index, :show]

# User Auth:
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  resources :users, :only => [:index, :new, :create]
  resources :sessions, :only => [:new, :create, :destroy]


end
