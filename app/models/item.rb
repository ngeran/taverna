class Item < ActiveRecord::Base
   belongs_to :category, :counter_cache => true
  
  #Find All Items That belong to a specific Menu
  def menu_items(menu_id)
     Item.joins(:category => :catalogs).where(:catalog_id => menu_id)
  end
  
  #CSV Method
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |item|
        csv << item.attributes.values_at(*column_names)
      end
    end
  end
  
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      item = find_by_id(row["id"]) || new
      item.attributes = row.to_hash.slice(*Item.attribute_names())
      item.save!
    end
  end
end
