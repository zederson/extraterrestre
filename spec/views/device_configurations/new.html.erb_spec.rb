require 'rails_helper'

RSpec.describe 'device_configurations/new', type: :view do
  before(:each) do
    @device = assign(:device, create(:device_lampada))
    assign(:device_configuration, build(:device_configuration))
  end

  it 'renders new device_configuration form' do
    render
    assert_select 'form[action=?][method=?]', device_device_configurations_path(@device), 'post' do
      assert_select 'input#device_configuration_name[name=?]', 'device_configuration[name]'
      assert_select 'textarea#device_configuration_description[name=?]', 'device_configuration[description]'
      assert_select 'textarea#device_configuration_content[name=?]', 'device_configuration[content]'
    end
  end
end
