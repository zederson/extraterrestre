FactoryGirl.define do
  factory :activity do
    trigger { |_a| create(:trigger_start) }
    device_configuration { |_a| create(:device_configuration) }
  end
end
