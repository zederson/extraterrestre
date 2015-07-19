Rails.application.routes.draw do

  namespace :api do
    post '/trigger/:trigger_name', to: 'house#trigger'
  end

  resources :activities
  resources :devices do
    resources :device_configurations
  end

  resources :triggers
  root 'home#index'
end
