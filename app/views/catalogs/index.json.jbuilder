json.array!(@catalogs) do |catalog|
  json.extract! catalog, :id, :title
  json.url catalog_url(catalog, format: :json)
end
