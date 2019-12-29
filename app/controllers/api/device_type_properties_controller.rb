module Api
  class DeviceTypePropertiesController < ApplicationController
    def index
      @dtype_properties = DeviceTypeProperty.all
      render json: @dtype_properties
    end
  end
end
