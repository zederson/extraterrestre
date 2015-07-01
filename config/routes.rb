Rails.application.routes.draw do

  resources :devices
  root 'home#index'
  resources :triggers

end
