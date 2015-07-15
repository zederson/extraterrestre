FactoryGirl.define do
  factory :device_lampada, class: Device do
    name 'Philips Hue'
    description 'Lampda RGB'
    device_type Device::IN
  end
end
