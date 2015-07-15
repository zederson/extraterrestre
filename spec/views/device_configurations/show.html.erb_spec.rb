require 'rails_helper'

RSpec.describe 'device_configurations/show', type: :view do
  before(:each) do
    @device_configuration = assign(:device_configuration, create(:device_configuration))
    @device = assign(:device, @device_configuration.device)
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Vermelho/)
    expect(rendered).to match(/Cor/)
    expect(rendered).to match(/ff0000/)
  end
end
