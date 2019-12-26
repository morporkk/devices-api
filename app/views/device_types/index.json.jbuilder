json.device_types @types do |type|
  json.id type.id
  json.type type.name
  json.parents type.ancestors.pluck(:name) unless type.parent.nil?
end
