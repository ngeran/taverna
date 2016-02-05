# json.array!(@photos) do |photo|
#   json.extract! photo, :id, :title, :description, :image
# end
# json.photos @photos do |photo|
#   json.extract! photo, :id, :title, :description, :image
# end
json.photos @photos do |photo|
  json.id           photo.id
  json.title        photo.title
  json.description  photo.description
  json.url          photo.image.url
  json.updated_at   photo.updated_at
end
