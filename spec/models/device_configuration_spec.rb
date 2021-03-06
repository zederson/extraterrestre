require 'rails_helper'

RSpec.describe DeviceConfiguration, type: :model do
  describe 'ActiveRecord specification' do
    it { is_expected.to have_db_column(:id).of_type(:integer) }
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:description).of_type(:text) }
    it { is_expected.to have_db_column(:content).of_type(:text) }
  end

  it { should belong_to(:device) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:content) }
end
