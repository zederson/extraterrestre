class Device < ActiveRecord::Base
  has_many :device_configurations

  validates :name, :device_type, presence: true
  In = 'in'
  Out = 'out'
  Types = [Device::In, Device::Out]
end
