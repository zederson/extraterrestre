require 'rails_helper'

RSpec.describe 'triggers/new', type: :view do
  before(:each) do
    assign(:trigger, Trigger.new(
                       name: 'MyString',
                       description: 'MyText'
    ))
  end

  it 'renders new trigger form' do
    render

    assert_select 'form[action=?][method=?]', triggers_path, 'post' do
      assert_select 'input#trigger_name[name=?]', 'trigger[name]'

      assert_select 'textarea#trigger_description[name=?]', 'trigger[description]'
    end
  end
end
