class DevicesController < ApplicationController
  def index
    # preloads type for reducing number of querys
    @devices = paginate Device.all.includes(:device_type)
    render 'devices/index.json.jbuilder'
  end

  # Will show only properties of device that are not null
  # TODO:
  #      - refactor/optimize this mess
  def show
    @device = Device.find(params[:id])
    @values = DevicePropertyValue.where('device_id=?', params[:id])
    render 'devices/show.json.jbuilder'
  end

  def create
    @device = Device.new(device_params)
    if @device.save
      render json: @device
    else
      # return 422 status code
      render json: @device.errors.to_a, status: :unprocessable_entity
    end
  end

  def update
    @device = Device.find(params[:id])
    if @device.update_attributes(@device_params)
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
    params.require(:device).permit(:name, :device_type_id)
  end
end
