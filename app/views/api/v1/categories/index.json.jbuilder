# json.array!(@categories) do |category|
#   json.extract! category, :id, :name
#   json.items category.items do |item|
#   	json.extract! item, :id, :titlegr, :titleen, :price
#    end
# end
json.categories @categories do |category|
    json.extract! category, :id, :name, :updated_at
    json.items category.items do |item|
    	json.extract! item, :id, :titlegr, :titleen, :price, :updated_at
     end
end