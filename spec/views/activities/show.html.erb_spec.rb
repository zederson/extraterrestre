require 'rails_helper'

RSpec.describe "activities/show", type: :view do
  let(:act) { create(:activity) }
  before(:each) do
    @activity = assign(:activity, act)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(act.trigger.name)
    expect(rendered).to match(act.device_configuration.name)
  end
end
