class DevicesController < ApplicationController
  def index
    @devices = Device.all
    render json: @devices
  end

  def show
    @device = Device.find(params[:id])
    render json: @device
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
