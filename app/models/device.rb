class Device < ApplicationRecord
  belongs_to :device_type
  has_many   :device_property_values
  has_many   :device_type_properties, through: :device_property_values

  validates :name, presence: true, length: { maximum: 65 },
                   uniqueness: true
end
