require 'test_helper'

class DevicePropertyValueTest < ActiveSupport::TestCase
  def setup
    @d_property_value = device_property_values(:one)
  end

  should belong_to(:device)
  should belong_to(:device_type_property)

  test "should be valid" do
    assert @d_property_value.valid?
  end

  test "value should be present" do
    @d_property_value.value = "    "
    assert_not @d_property_value.valid?
  end

  test "value should not be too long" do
    @d_property_value.value = 'a' * 100
    assert_not @d_property_value.valid?
  end

  test "should belong to same type" do
    @d_property_value.device_type_property_id = 3
    assert_not @d_property_value.valid?
  end
end
