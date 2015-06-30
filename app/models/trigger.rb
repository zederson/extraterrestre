class Trigger < ActiveRecord::Base
  validates :name, presence: true
end
