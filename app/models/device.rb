class Device < ActiveRecord::Base
  validates :name, :device_type, presence: true
  In = 'in'
  Out = 'out'
  Types = [Device::In, Device::Out]
end
