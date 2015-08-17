module Api
  class LampsController < Api::ApplicationController
    respond_to :json

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

