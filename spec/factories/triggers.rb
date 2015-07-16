FactoryGirl.define do
  factory :trigger_start, class: Trigger do
    name 'start'
    description 'acão gerada quando chega na casa'
  end

  factory :trigger_off, class: Trigger do
    name 'off'
    description 'Ação gerada quando desliga'
  end
end
