class DeviceType < ApplicationRecord
  acts_as_tree
  # belongs_to :parent, class_name: :DeviceType, optional: true
  # has_many   :children, class_name: :DeviceType, foreign_key: :parent_id

  validates :name, presence: true, length: { maximum: 65 },
                   uniqueness: true

  # Return all properties of given DeviceType and it's ancestors in tree
  def properties
    DeviceTypeProperty.where(device_type_id: self_and_ancestors_ids)
  end
end
