class DevicePropertyValue < ApplicationRecord
  belongs_to :device
  belongs_to :device_type_property

  validates :value, presence: true, length: { maximum: 65 }
  validate  :same_type?

  private

  # Temporary, doesn't check parent types right noww
  # Have to make hierachical traversing up in device_type model first
  def same_type?
    return if device.device_type_id == device_type_property.device_type_id

    errors.add(:device_type_property_id, "must belong to same type")
  end
end
