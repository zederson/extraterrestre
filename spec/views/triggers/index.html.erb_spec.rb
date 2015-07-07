require 'rails_helper'

RSpec.describe 'triggers/index', type: :view do
  before(:each) do
    assign(:triggers, [
      Trigger.create!(
        name: 'Name',
        description: 'MyText'
      ),
      Trigger.create!(
        name: 'Name',
        description: 'MyText'
      )
    ])
  end

  it 'renders a list of triggers' do
    render
    assert_select 'span.task-title-sp>b', text: 'Name'.to_s, count: 2
    assert_select 'div.task-title>small', text: 'MyText'.to_s, count: 2
  end
end
