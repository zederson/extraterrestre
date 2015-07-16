class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.belongs_to :trigger, index: true, foreign_key: true
      t.belongs_to :device_configuration, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
