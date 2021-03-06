require 'rails_helper'

RSpec.describe 'devices/index', type: :view do
  before(:each) do
    assign(:devices,
           create_list(:device_lampada, 2, name: 'Name', description: 'MyText')
          )
  end

  it 'renders a list of devices' do
    render
    assert_select 'span.task-title-sp>b', text: 'Name'.to_s, count: 2
    assert_select 'div.task-title>small', text: 'MyText'.to_s, count: 2
  end
end
