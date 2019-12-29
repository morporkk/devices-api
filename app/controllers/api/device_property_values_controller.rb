module Api
  class DevicePropertyValuesController < ApplicationController
    def index
      @device_property_values = DevicePropertyValue.all
      render json: @device_property_values
    end

    def show
      @device_property_value = DevicePropertyValue.find(params[:id])
      render json: @device_property_value
    end
  end
end
