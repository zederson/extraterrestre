class Device < ActiveRecord::Base
  validates :name, presence: true
end
