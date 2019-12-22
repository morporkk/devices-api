require 'test_helper'

class DeviceTypePropertyTest < ActiveSupport::TestCase
  def setup
    @dt_property = device_type_properties(:one)
  end

  should belong_to(:device_type)

  test "should be valid" do
    assert @dt_property.valid?
  end

  test "name should be present" do
    @dt_property.name = "    "
    assert_not @dt_property.valid?
  end

  test "name should not be too long" do
    @dt_property.name = 'a' * 100
    assert_not @dt_property.valid?
  end

  test "name should be unique" do
    duplicate_property = @dt_property.dup
    @dt_property.save
    assert_not duplicate_property.valid?
  end
end
