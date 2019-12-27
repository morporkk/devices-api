json.device_types @types.roots do |root|
  json.id root.id
  json.name root.name

  json.subtypes root.children do |child|
    json.id child.id
    json.name child.name
    unless child.leaf?
      json.subtypes child.children do |gc|
        json.id gc.id
        json.name gc.name
      end
    end
  end
end
