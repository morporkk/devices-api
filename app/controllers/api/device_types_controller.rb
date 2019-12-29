module Api
  class DeviceTypesController < ApplicationController
    def index
      @types = DeviceType.all
      render 'device_types/index.json.jbuilder'
    end

    def show
      @type = DeviceType.find(params[:id])
      render 'device_types/show.json.jbuilder'
    end

    def create
      @type = DeviceType.new(device_type_params)
      if @type.save
        render 'device_types/show.json.jbuilder'
      else
        # return 422 status code
        render json: @type.errors.to_a, status: :unprocessable_entity
      end
    end

    def update
      device_type = DeviceType.find(params[:id])
      if device_type.update_attributes(device_type_params)
        render json: device_type
      else
        # return 422 status code
        render json: device_type.errors.to_a, status: :unprocessable_entity
      end
    end

    def destroy
      device_type = DeviceType.find(params[:id])
      device_type.destroy
      # destroy returns object that was deleted from db
      # reconsider this
      render json: device_type
    end

    private

    # Protection from end-user assignment
    def device_type_params
      params.require(:device_type).permit(:name, :parent_id,
                                          device_type_properties_attributes: [:name])
    end
  end
end
