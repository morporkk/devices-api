json.device do
  json.id @device.id
  json.name @device.name
  json.type @device.device_type.name

  values = DevicePropertyValue.where('device_id=?', @device.id)
  json.properties @device.device_type_properties do |property|
    json.name property.name
    json.value values.find_by(device_type_property_id: property.id).value
  end
end
