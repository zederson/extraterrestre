module Api
  class HouseController < ApplicationController

    def trigger
      name = params[:trigger_name]
      Trigger.execute name
      render status: 200, json: { name: name }
    end

  end
end
