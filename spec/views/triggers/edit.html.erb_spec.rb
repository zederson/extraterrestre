require 'rails_helper'

RSpec.describe 'triggers/edit', type: :view do
  before(:each) do
    @trigger = assign(:trigger, Trigger.create!(
                                  name: 'MyString',
                                  description: 'MyText'
    ))
  end

  it 'renders the edit trigger form' do
    render

    assert_select 'form[action=?][method=?]', trigger_path(@trigger), 'post' do
      assert_select 'input#trigger_name[name=?]', 'trigger[name]'

      assert_select 'textarea#trigger_description[name=?]', 'trigger[description]'
    end
  end
end
