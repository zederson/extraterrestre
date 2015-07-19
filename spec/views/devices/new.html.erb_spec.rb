require 'rails_helper'

RSpec.describe 'devices/new', type: :view do
  before(:each) do
    assign(:device, build(:device_lampada))
  end

  it 'renders new device form' do
    render

    assert_select 'form[action=?][method=?]', devices_path, 'post' do
      assert_select 'input#device_name[name=?]', 'device[name]'
      assert_select 'input#device_module_name[name=?]', 'device[module_name]'
      assert_select 'textarea#device_description[name=?]', 'device[description]'
      assert_select 'input#device_device_type[name=?]', 'device[device_type]'
    end
  end
end
