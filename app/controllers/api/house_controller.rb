module Api
  class HouseController < Api::ApplicationController
    respond_to :json

    def trigger
      name = params[:trigger_name]
      Trigger.execute name
      render status: 200, json: { name: name }
    end

    def toggle
      key = request.headers["Key-Tag"]
      HouseToogleServices.toogle
      head :ok, json: {name: 'Test'}
    end
  end
end
