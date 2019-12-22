Rails.application.routes.draw do
  root 'devices#index'

  resources :device_types
  resources :devices
  resources :device_type_properties, only: [:index]
  resources :device_property_values, only: %i[index show]
end
