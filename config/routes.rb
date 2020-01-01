# == Route Map
#
#                    Prefix Verb   URI Pattern                                                                              Controller#Action
#          api_device_types GET    /api/device_types(.:format)                                                              api/device_types#index
#                           POST   /api/device_types(.:format)                                                              api/device_types#create
#           api_device_type GET    /api/device_types/:id(.:format)                                                          api/device_types#show
#                           PATCH  /api/device_types/:id(.:format)                                                          api/device_types#update
#                           PUT    /api/device_types/:id(.:format)                                                          api/device_types#update
#                           DELETE /api/device_types/:id(.:format)                                                          api/device_types#destroy
#               api_devices GET    /api/devices(.:format)                                                                   api/devices#index
#                           POST   /api/devices(.:format)                                                                   api/devices#create
#                api_device GET    /api/devices/:id(.:format)                                                               api/devices#show
#                           PATCH  /api/devices/:id(.:format)                                                               api/devices#update
#                           PUT    /api/devices/:id(.:format)                                                               api/devices#update
#                           DELETE /api/devices/:id(.:format)                                                               api/devices#destroy
#        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  namespace :api do
    resources :device_types
    resources :devices
  end
end
