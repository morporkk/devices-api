class Device < ApplicationRecord
  belongs_to :device_type
  has_many   :device_property_values
  has_many   :device_type_properties, through: :device_property_values

  validates :name, presence: true, length: { maximum: 65 },
                   uniqueness: true

  # search filters
  scope :by_name, ->(name) { where("lower(name) LIKE ?", "%#{name.downcase}%")}
  scope :by_type, ->(type_id) { where("device_type_id = ?", type_id)}
  scope :by_type_name, ->(type) { joins(:device_type).where(device_types: {name: type}) }
  # return only records updated X months/days/hours ago
  scope :date_by_month, ->(months) { where("updated_at > ?", months.month.ago) }
  scope :date_by_day, ->(days) { where("updated_at > ?", days.day.ago) }
  scope :date_by_hour, ->(hours) { where("updated_at > ?", hours.hour.ago) }
end
