class CreateDevicePropertyValues < ActiveRecord::Migration[5.2]
  def change
    create_table :device_property_values do |t|
      t.string     :value, null: false
      t.references :device, foreign_key: true
      t.references :device_type_property, foreign_key: true
      t.timestamps
    end
  end
end
