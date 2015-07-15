require 'rails_helper'

RSpec.describe 'device_configurations/edit', type: :view do
  before do
    @device_configuration = assign(:device_configuration, create(:device_configuration))
    @device = assign(:device, @device_configuration.device)
  end

  it 'renders the edit device_configuration form' do
    render

    assert_select 'form[action=?][method=?]', device_device_configuration_path(@device, @device_configuration.id), 'post' do
      assert_select 'input#device_configuration_name[name=?]', 'device_configuration[name]'
      assert_select 'textarea#device_configuration_description[name=?]', 'device_configuration[description]'
      assert_select 'textarea#device_configuration_content[name=?]', 'device_configuration[content]'
    end
  end
end
