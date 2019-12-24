# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)


DeviceType.create(name: "PC")
DeviceType.create(name: "NoteBook", parent_id: 1)
DeviceType.create(name: "NetBook", parent_id: 1)
DeviceType.create(name: "2in1 Laptop", parent_id: 2)
DeviceType.create(name: "Speakers")

Device.create(name: "Dell Tower", device_type_id: 1)
Device.create(name: "Hp Desktop112", device_type_id: 1)
Device.create(name: "Lenovo x789", device_type_id: 2)
Device.create(name: "Lenovo mini", device_type_id: 4)
Device.create(name: "Yamaha 555333", device_type_id: 5)

DeviceTypeProperty.create(name: "RAM", device_type_id: 1)
DeviceTypeProperty.create(name: "CPU", device_type_id: 1)
DeviceTypeProperty.create(name: "OS", device_type_id: 1)
DeviceTypeProperty.create(name: "GPU", device_type_id: 1)
DeviceTypeProperty.create(name: "PSU", device_type_id: 1)
DeviceTypeProperty.create(name: "MOBO", device_type_id: 1)

DeviceTypeProperty.create(name: "DIAG", device_type_id: 2)
DeviceTypeProperty.create(name: "Battery", device_type_id: 2)
DeviceTypeProperty.create(name: "Weight", device_type_id: 2)

DeviceTypeProperty.create(name: "Power", device_type_id: 5)

DevicePropertyValue.create(value: "16GB", device_id: 1, device_type_property_id: 1)
DevicePropertyValue.create(value: "Ryzen7 1700", device_id: 1, device_type_property_id: 2)
DevicePropertyValue.create(value: "Windows10", device_id: 1, device_type_property_id: 3)

DevicePropertyValue.create(value: "8GB", device_id: 2, device_type_property_id: 1)
DevicePropertyValue.create(value: "Intel i3 4xxx", device_id: 2, device_type_property_id: 2)
DevicePropertyValue.create(value: "Windows10", device_id: 2, device_type_property_id: 3)

DevicePropertyValue.create(value: "16GB", device_id: 3, device_type_property_id: 1)
DevicePropertyValue.create(value: "Ryzen5", device_id: 3, device_type_property_id: 2)
DevicePropertyValue.create(value: "Windows10", device_id: 3, device_type_property_id: 3)
DevicePropertyValue.create(value: "14.5 inch", device_id: 3, device_type_property_id: 7)


DevicePropertyValue.create(value: "50W", device_id: 5, device_type_property_id: 10)
