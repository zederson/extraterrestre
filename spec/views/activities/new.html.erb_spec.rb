require 'rails_helper'

RSpec.describe "activities/new", type: :view do
  before(:each) do
    assign(:activity, Activity.new)
  end

  it "renders new activity form" do
    render
    assert_select "form[action=?][method=?]", activities_path, "post" do
      assert_select "select#activity_trigger_id[name=?]", "activity[trigger_id]"
      assert_select "select#activity_device_configuration_id[name=?]", "activity[device_configuration_id]"
    end
  end
end
