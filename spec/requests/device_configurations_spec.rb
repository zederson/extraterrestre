require 'rails_helper'

RSpec.describe "DeviceConfigurations", type: :request do
  describe "GET /device_configurations" do
    let(:device) { create(:device_lampada) }
    it "works! (now write some real specs)" do
      get device_device_configurations_path(device)
      expect(response).to have_http_status(200)
    end
  end
end
