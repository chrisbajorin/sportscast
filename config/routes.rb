Rails.application.routes.draw do

  resources :baseballs

  root "welcome#index"

  resources :footballs

end
