class DeviceConfiguration < ActiveRecord::Base
  belongs_to :device
  validates :name, :content, presence: true
end
