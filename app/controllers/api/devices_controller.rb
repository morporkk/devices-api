module Api
  class DevicesController < ApplicationController
    def index
      # preloads type for reducing number of querys
      @devices = paginate Device.all.includes(:device_type)

      filtering_params(params).each do |key, value|
        @devices = @devices.public_send("by_#{key}", value) if value.present?
      end

      render 'devices/index.json.jbuilder'
    end

    def show
      @device = Device.find(params[:id])
      render 'devices/show.json.jbuilder'
    end

    # Properties that dont pass validation will be ignored
    # TODO:
    #  -Unnecessary huge number of queries, try to preload needed models
    def create
      # byebug
      @device = Device.new(device_params)
      if @device.save
        render 'devices/show.json.jbuilder'
      else
        # return 422 status code
        render json: @device.errors.to_a, status: :unprocessable_entity
      end
    end

    def update
      @device = Device.find(params[:id])
      if @device.update_attributes(device_params)
        render json: @device
      else
        # return 422 status code
        render json: @device.errors.to_a, status: :unprocessable_entity
      end
    end

    def destroy
      @device = Device.find(params[:id])
      @device.destroy
      # destroy returns object that was deleted from db
      # reconsider this
      render json: @device
    end

    private

    # Protection from end-user assignment
    def device_params
      params.require(:device).permit(:name, :device_type_id,
        device_property_values_attributes: [:value, :device_type_property_id])
    end

    def filtering_params(params)
      params.slice(:name, :type_id, :type, :month, :day, :hour)
    end
  end
end
