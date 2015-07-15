require 'rails_helper'

RSpec.describe "device_configurations/index", type: :view do
  before(:each) do
    device = create(:device_lampada)
    assign(:device, device)
    assign(:device_configurations, create_list(:device_configuration, 2, device: device))
  end

  it "renders a list of device_configurations" do
    render
    assert_select 'span.task-title-sp>b', text: 'Vermelho'.to_s, count: 2
    assert_select 'div.task-title>small', text: '#ff0000'.to_s, count: 2
  end
end
