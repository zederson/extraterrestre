Rails.application.routes.draw do

  namespace :api do
    post '/trigger/:trigger_name',  to: 'house#trigger'
    put '/trigger/toggle',          to: 'house#toggle'
    put '/bender/lamps',            to: 'lamps#update'
    put '/bender/lamps/:id',        to: 'lamps#set_color'
    put '/bender/sensor_light',     to: 'lamps#sensor_light'
    put '/bender/:id/socket',       to: 'socket#update'
  end

  resources :activities
  resources :devices do
    resources :device_configurations
  end

  resources :triggers
  root 'home#index'
end
