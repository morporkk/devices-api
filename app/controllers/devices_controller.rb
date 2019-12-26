class DevicesController < ApplicationController
  def index
    # preloads type for reducing number of querys
    @devices = paginate Device.all.includes(:device_type)
    @devices = @devices.by_name(params[:name]) if params[:name].present?
    @devices = @devices.by_type(params[:type_id]) if params[:type_id].present?
    @devices = @devices.date_by_hour(params[:hour].to_i) if params[:hour].present?
    @devices = @devices.date_by_day(params[:day].to_i) if params[:day].present?
    @devices = @devices.date_by_month(params[:month].to_i) if params[:month].present?
    @devices = @devices.by_type_name(params[:type]) if params[:type]
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
    @device = Device.new(device_params)
    if @device.save
      @device.device_property_values.create(property_params)
      render 'devices/show.json.jbuilder'
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

  # Whitelist array of objects under device_property_values
  def property_params
    params.permit(device_property_values: %i[value device_type_property_id])
          .require(:device_property_values)
  end
end
