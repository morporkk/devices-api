# == Schema Information
#
# Table name: device_type_properties
#
#  id             :bigint           not null, primary key
#  name           :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  device_type_id :bigint
#
# Indexes
#
#  index_device_type_properties_on_device_type_id  (device_type_id)
#
# Foreign Keys
#
#  fk_rails_...  (device_type_id => device_types.id)
#

class DeviceTypeProperty < ApplicationRecord
  belongs_to :device_type

  validates :name, presence: true, length: { maximum: 65 },
                   uniqueness: true
end
