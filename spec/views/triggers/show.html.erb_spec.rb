require 'rails_helper'

RSpec.describe 'triggers/show', type: :view do
  before(:each) do
    @trigger = assign(:trigger, Trigger.create!(
                                  name: 'Name',
                                  description: 'MyText'
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
  end
end
