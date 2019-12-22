Rails.application.routes.draw do
  root 'devices#index'

  resources :device_types
  resources :devices
end
