class Activity < ActiveRecord::Base
  belongs_to :trigger
  belongs_to :device_configuration
end
