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
