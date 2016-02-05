json.array!(@main_navs) do |main_nav|
  json.extract! main_nav, :id, :title, :url
  json.url main_nav_url(main_nav, format: :json)
end
