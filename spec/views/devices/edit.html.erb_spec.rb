require 'rails_helper'

RSpec.describe 'devices/edit', type: :view do
  before(:each) do
    @device = assign(:device,
                     create(:device_lampada, name: 'Name', description: 'MyText')
                    )
  end

  it 'renders the edit device form' do
    render

    assert_select 'form[action=?][method=?]', device_path(@device), 'post' do
      assert_select 'input#device_name[name=?]', 'device[name]'
      assert_select 'textarea#device_description[name=?]', 'device[description]'
      assert_select 'input#device_device_type[name=?]', 'device[device_type]'
    end
  end
end
