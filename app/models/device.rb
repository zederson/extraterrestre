class Device < ActiveRecord::Base
  has_many :device_configurations

  validates :name, :device_type, presence: true
  IN = 'in'
  OUT = 'out'
  TYPES = [Device::IN, Device::OUT]
end
