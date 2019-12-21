require 'test_helper'

class DeviceTypeTest < ActiveSupport::TestCase
  def setup
    @device_type = device_types(:nb)
  end

  should belong_to(:parent).class_name('DeviceType')
  should have_many(:children).class_name('DeviceType')

  test "should be valid" do
    assert @device_type.valid?
  end

  test "name should be present" do
    @device_type.name = "   "
    assert_not @device_type.valid?
  end

  test "parent_id should be optional" do
    @device_type.parent_id = nil
    assert @device_type.valid?
  end

  test "name should not be too long" do
    @device_type.name = "a" * 100
    assert_not @device_type.valid?
  end

  test "name should be unique" do
    duplicate_type = @device_type.dup
    @device_type.save

    assert_not duplicate_type.valid?
  end
end
