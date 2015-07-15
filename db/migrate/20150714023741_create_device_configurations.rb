class CreateDeviceConfigurations < ActiveRecord::Migration
  def change
    create_table :device_configurations do |t|
      t.string :name
      t.text :description
      t.text :content
      t.belongs_to :device, index: true, foreing_key: true

      t.timestamps null: false
    end
  end
end
