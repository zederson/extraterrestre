module Api
  class SocketController < Api::ApplicationController
    respond_to :json

    def update
      result = change_socket
      render :ok, json: { status: result['status'] }
    end

    private

    def change_socket
      values = params[:socket]
      Bender::Api::Socket.send params[:id], values[:status]
    end
  end
end

