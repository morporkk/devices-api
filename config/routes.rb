Rails.application.routes.draw do
  namespace :api do
    resources :device_types
    resources :devices
  end
end
