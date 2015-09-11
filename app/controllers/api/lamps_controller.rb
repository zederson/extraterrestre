module Api
  class LampsController < Api::ApplicationController
    respond_to :json

    def sensor_light
      result = Bender::Api::Model.sensor_light params[:status]
      render :ok, json: { status: result['status'] }
    end

    def set_color
      bulb = params[:bulb]
      hue = Huey::Bulb.find(params[:id].to_i)
      if hue.present?
        hue.rgb = bulb[:color]
        hue.on = true
        hue.commit
      end

      head :ok
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

