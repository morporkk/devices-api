# == Schema Information
#
# Table name: device_property_values
#
#  id                      :bigint           not null, primary key
#  value                   :string           not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  device_id               :bigint
#  device_type_property_id :bigint
#
# Indexes
#
#  device_property_value_indexes                            (device_id,device_type_property_id) UNIQUE
#  index_device_property_values_on_device_id                (device_id)
#  index_device_property_values_on_device_type_property_id  (device_type_property_id)
#
# Foreign Keys
#
#  fk_rails_...  (device_id => devices.id)
#  fk_rails_...  (device_type_property_id => device_type_properties.id)
#

class DevicePropertyValue < ApplicationRecord
  belongs_to :device
  belongs_to :device_type_property

  validates :value, presence: true, length: { maximum: 65 }
  validate  :correct_type

  private

  # Traverse up DeviceType tree to get all parent id's and match if property
  # belongs to any type in path.
  # Only tested manualy 
  # TODO: - Try to optimize
  #       - Try again to integrate coerce gem into minitest
  def correct_type
    type = DeviceType.where('id = ?', device.device_type_id).take
    path = type.self_and_ancestors_ids
    return if path.include?(device_type_property.device_type_id)

    errors.add(:device_type_property_id, "must belong to same type")
  end
end
