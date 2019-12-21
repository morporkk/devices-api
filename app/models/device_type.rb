class DeviceType < ApplicationRecord

  belongs_to :parent, class_name: :DeviceType, optional: true
  has_many   :children, class_name: :DeviceType, foreign_key: :parent_id

  validates :name, presence: true, length: { maximum: 65 },
                   uniqueness: true
end
