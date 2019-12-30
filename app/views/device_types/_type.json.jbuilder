json.device_type do
  json.id @type.id
  json.name @type.name
  json.properties @type.properties do |property|
    json.device_type_id property.device_type_id
    json.name property.name
  end
end