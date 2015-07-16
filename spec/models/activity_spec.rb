require 'rails_helper'

RSpec.describe Activity, type: :model do
  describe 'ActiveRecord specification' do
    it { is_expected.to have_db_column(:id).of_type(:integer) }
    it { is_expected.to have_db_column(:trigger_id).of_type(:integer) }
    it { is_expected.to have_db_column(:device_configuration_id).of_type(:integer) }
  end
  it { should belong_to(:device_configuration) }
  it { should belong_to(:trigger) }
end
