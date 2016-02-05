json.array!(@albums) do |album|
  json.extract! album, :id, :title, :description
  json.items album.photos do |photo|
  	json.extract! photo, :id, :title, :description, :image
   end
end