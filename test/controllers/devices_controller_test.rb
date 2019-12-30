require 'test_helper'

class DevicesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @device = devices(:dsk)
  end

  test "should get index" do
    get api_devices_url
    assert_response :success
    assert_template 'devices/index.json.jbuilder'
  end

  test "should get show" do
    get api_device_url(@device)
    assert_response :success
    assert_template 'devices/show.json.jbuilder'
  end

  test "should reject invalid device create params" do
    post api_devices_url, params: { device: { name: "",
                                              device_type_id: "one" } }
    assert_response :unprocessable_entity
  end

  test "should accept valid device create params" do
    post api_devices_url, params: { device: { name: "GhetoBlaster",
                                              device_type_id: 1 } }
    assert_response :success
  end

  test "should delete device" do
    assert_difference "Device.count", -1 do
      delete api_device_url(@device)
    end
  end
end
