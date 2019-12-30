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
        render 'device_types/create.json.jbuilder'
      else
        # return 422 status code
        render json: @type.errors.to_a, status: :unprocessable_entity
      end
    end

    def update
      @type = DeviceType.find(params[:id])
      if @type.update_attributes(device_type_params)
        render 'device_types/update.json.jbuilder'
      else
        # return 422 status code
        render json: @type.errors.to_a, status: :unprocessable_entity
      end
    end

    def destroy
      @type = DeviceType.find(params[:id])
      @type.destroy
      render json: { status: "Deleted", id: @type.id, name: @type.name }
    end

    private

    # Protection from end-user assignment
    def device_type_params
      params.require(:device_type).permit(:name, :parent_id,
                                          device_type_properties_attributes: [:name])
    end
  end
end
