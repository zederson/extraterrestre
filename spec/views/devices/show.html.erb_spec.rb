require 'rails_helper'

RSpec.describe 'devices/show', type: :view do
  before(:each) do
    @device = assign(:device,
                     create(:device_lampada, name: 'Name', description: 'MyText', module_name: 'MODULE')
                    )
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/in/)
    expect(rendered).to match(/MODULE/)
  end
end
