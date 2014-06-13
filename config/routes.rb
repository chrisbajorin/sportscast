Rails.application.routes.draw do

  root "users#new"

  resources :baseballs

  # root "welcome#index"

  resources :footballs
  resources :users
  resources :sessions

end
