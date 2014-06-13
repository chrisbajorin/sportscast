Rails.application.routes.draw do

  # root "welcome#index"
  root "users#new"

  resources :footballs
  resources :users
  resources :sessions

end
