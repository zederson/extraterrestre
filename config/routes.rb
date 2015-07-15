Rails.application.routes.draw do
  resources :devices do
    resources :device_configurations
  end

  resources :triggers
  root 'home#index'
end
