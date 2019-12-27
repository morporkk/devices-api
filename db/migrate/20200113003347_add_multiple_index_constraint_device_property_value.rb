class AddMultipleIndexConstraintDevicePropertyValue < ActiveRecord::Migration[5.2]
  def change
    add_index :device_property_values, [:device_id, :device_type_property_id],
              unique: true,
              name: "device_property_value_indexes"
  end
end
