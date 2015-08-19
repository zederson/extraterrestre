module Api
  class LampsController < Api::ApplicationController
    respond_to :json

    def sensor_light
      result = Bender::Api::Model.sensor_light params[:status]
      render :ok, json: { status: result['status'] }
    end

    def update
      change_lamp
      head :ok
    end

    def change_lamp
      hue = Huey::Bulb.all
      params[:bulb].each { |k,v| hue.send("#{k.to_s}=", v) }
      hue.commit
    end
  end
end

