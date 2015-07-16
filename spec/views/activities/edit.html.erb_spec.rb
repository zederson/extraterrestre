require 'rails_helper'

RSpec.describe 'activities/edit', type: :view do
  before(:each) do
    @activity = assign(:activity, create(:activity))
  end

  it 'renders the edit activity form' do
    render

    assert_select 'form[action=?][method=?]', activity_path(@activity), 'post' do
      assert_select 'select#activity_trigger_id[name=?]', 'activity[trigger_id]'
      assert_select 'select#activity_device_configuration_id[name=?]', 'activity[device_configuration_id]'
    end
  end
end
