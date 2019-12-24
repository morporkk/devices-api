json.device @devices do |device|
  json.id device.id
  json.name device.name

  json.type device.device_type.name
end
