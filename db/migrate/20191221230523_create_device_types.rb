class CreateDeviceTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :device_types do |t|
      t.string :name, null: false
      t.references :parent, index: true, foreign_key: { to_table: :device_types }
      t.timestamps
    end
  end
end
