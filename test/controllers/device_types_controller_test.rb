require 'test_helper'

class DeviceTypesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @type         = device_types(:pc)
    @unused_type  = device_types(:sk)
  end

  test "should get index" do
    get api_device_types_path
    assert_response :success
    assert_template 'device_types/index.json.jbuilder'
  end

  test "should get show" do
    get api_device_type_path(@type)
    assert_response :success
    assert_template 'device_types/show.json.jbuilder'
  end

  test "invalid device_type create params" do
    assert_no_difference 'DeviceType.count' do
      post api_device_types_url, params: { device_type: { name: "",
                                                device_type_id: "ojha" } }
    end
    assert_response :unprocessable_entity
  end

  test "valid device_type create params" do
    assert_difference 'DeviceType.count', 1 do
      post api_device_types_url, params: { device_type: { name: "Masinica",
                                                parent_id: 1 } }
    end
    assert_response :success
  end

  test "should not delete device type that got devices in db" do
    assert_raises ActiveRecord::DeleteRestrictionError do
      delete api_device_type_path(@type)
    end
  end

  test "should delete device_type that doesn't have any devices in db" do
    assert_difference 'DeviceType.count', -1 do
      delete api_device_type_path(@unused_type)
    end
  end

  test "should be able to create type properties alogn with device type" do
    assert_difference "DeviceTypeProperty.count", 1 do
      post api_device_types_url, params:
      { device_type: { name: "Masinica",
                       device_type_properties_attributes: [ name: "moc"] } }
    end
  end
end
