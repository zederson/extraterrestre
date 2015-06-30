require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  render_views

  describe "GET #index" do
    before { get :index }

    it { expect(response).to be_success }
    it { expect(response).to render_template(:index) }
  end
end
