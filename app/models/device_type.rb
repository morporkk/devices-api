# == Schema Information
#
# Table name: device_types
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  parent_id  :bigint
#
# Indexes
#
#  index_device_types_on_parent_id  (parent_id)
#
# Foreign Keys
#
#  fk_rails_...  (parent_id => device_types.id)
#

class DeviceType < ApplicationRecord
  acts_as_tree

  # belongs_to :parent, class_name: :DeviceType, optional: true
  # has_many :children, class_name: :DeviceType, foreign_key: :parent_id
  has_many :devices, dependent: :restrict_with_exception
  has_many :device_type_properties, dependent: :destroy
  accepts_nested_attributes_for :device_type_properties

  validates :name, presence: true, length: { maximum: 65 },
                   uniqueness: true

  # Return all properties of given DeviceType and it's ancestors in tree
  def properties
    DeviceTypeProperty.where(device_type_id: self_and_ancestors_ids)
  end
end
