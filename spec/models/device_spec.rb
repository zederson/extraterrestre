require 'rails_helper'

RSpec.describe Device, type: :model do
  describe 'ActiveRecord specification' do
    it { is_expected.to have_db_column(:id).of_type(:integer) }
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:device_type).of_type(:string) }
    it { is_expected.to have_db_column(:description).of_type(:text) }
  end

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:device_type) }

  describe '.Types' do
    it { expect(Device::Types).to contain_exactly('in', 'out') }
    it { expect(Device::In).to eql 'in' }
    it { expect(Device::Out).to eql 'out' }
  end
end
