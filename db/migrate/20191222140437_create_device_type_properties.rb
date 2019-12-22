class CreateDeviceTypeProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :device_type_properties do |t|
      t.string :name, null: false
      t.references :device_type, foreign_key: true
      t.timestamps
    end
  end
end
