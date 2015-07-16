require 'rails_helper'

RSpec.describe 'activities/index', type: :view do
  let(:activity) { create(:activity) }
  before(:each) do
    assign(:activities, [activity])
  end

  it 'renders a list of activities' do
    render
    assert_select 'span.task-title-sp>b', text: activity.trigger.name, count: 1
    assert_select 'div.task-title>small', text: activity.device_configuration.name, count: 1
  end
end
