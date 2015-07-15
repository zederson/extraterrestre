class DeviceConfigurationsController < ApplicationController
  before_action :set_device_configuration, only: [:show, :edit, :update, :destroy]
  before_action :set_device

  def index
    @device_configurations = @device.device_configurations
  end

  def show
  end

  def new
    @device_configuration = DeviceConfiguration.new
  end

  def edit
  end

  def create
    hash = device_configuration_params.merge(device_id: @device.id)
    @device_configuration = DeviceConfiguration.new(hash)

    if @device_configuration.save
      path = device_device_configurations_path(@device, @device_configuration)
      redirect_to path, notice: 'Device configuration was successfully created.'
    else
      render :new
    end
  end

  def update
    if @device_configuration.update(device_configuration_params)
      path = device_device_configuration_path(@device, @device_configuration)
      redirect_to path, notice: 'Device configuration was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @device_configuration.destroy
    path = device_device_configurations_url(@device_configuration.device)
    redirect_to path, notice: 'Device configuration was successfully destroyed.'
  end

  private

  def set_device_configuration
    @device_configuration = DeviceConfiguration.find(params[:id])
  end

  def device_configuration_params
    params.require(:device_configuration).permit(:name, :description, :content)
  end

  def set_device
    @device = Device.find(params[:device_id])
  end
end
