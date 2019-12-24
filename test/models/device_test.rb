require 'test_helper'

class DeviceTest < ActiveSupport::TestCase
  def setup
    @device = devices(:dsk)
  end

  should belong_to(:device_type)
  should have_many(:device_property_values)
  should have_many(:device_type_properties).through(:device_property_values)

  test "should be valid" do
    assert @device.valid?
  end

  test "name should be present" do
    @device.name = "    "
    assert_not @device.valid?
  end

  test "name should not be too long" do
    @device.name = 'a' * 100
    assert_not @device.valid?
  end

  test "name should be unique" do
    duplicate_device = @device.dup
    @device.save
    assert_not duplicate_device.valid?
  end
end
