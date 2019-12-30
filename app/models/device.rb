class Device < ApplicationRecord
  belongs_to :device_type
  has_many   :device_property_values, dependent: :destroy
  has_many   :device_type_properties, through: :device_property_values
  accepts_nested_attributes_for :device_property_values

  validates :name, presence: true, length: { maximum: 65 },
                   uniqueness: true

  # search filter lambdas
  scope :by_type, ->(type) { joins(:device_type).where(device_types: {name: type}) }
  scope :by_name, ->(name) { where("lower(devices.name) LIKE ?", "%#{name.downcase}%")}
  scope :by_type_id, ->(type_id) { where("device_type_id = ?", type_id)}
  # return only records updated X months/days/hours ago
  scope :by_month, ->(months) { where("devices.updated_at > ?", months.to_i.month.ago) }
  scope :by_day, ->(days) { where("devices.updated_at > ?", days.to_i.day.ago) }
  scope :by_hour, ->(hours) { where("devices.updated_at > ?", hours.to_i.hour.ago) }
end
