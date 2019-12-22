class DeviceTypeProperty < ApplicationRecord
  belongs_to :device_type

  validates :name, presence: true, length: { maximum: 65 },
                   uniqueness: true
end
