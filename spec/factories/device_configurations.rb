FactoryGirl.define do
  factory :device_configuration do
    name 'Vermelho'
    description 'Cor Vermelha'
    content '#ff0000'
    device { |_p| create(:device_lampada) }
  end
end
