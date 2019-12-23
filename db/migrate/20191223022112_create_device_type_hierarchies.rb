class CreateDeviceTypeHierarchies < ActiveRecord::Migration[5.2]
  def change
    create_table :device_type_hierarchies, id: false do |t|
      t.integer :ancestor_id, null: false
      t.integer :descendant_id, null: false
      t.integer :generations, null: false
    end

    add_index :device_type_hierarchies, [:ancestor_id, :descendant_id, :generations],
      unique: true,
      name: "device_type_anc_desc_idx"

    add_index :device_type_hierarchies, [:descendant_id],
      name: "device_type_desc_idx"
  end
end
