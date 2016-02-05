json.array!(@photos) do |photo|
  json.extract! photo, :id, :album_id, :image, :title, :description, :content_type, :file_size, :uploaded_by
  json.url photo_url(photo, format: :json)
end
