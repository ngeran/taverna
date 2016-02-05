class Catalog < ActiveRecord::Base
  has_many :categories
  has_many :items
   # Accepts Nested Attributes 
  accepts_nested_attributes_for :categories, allow_destroy: true
  
  #Find All Items Belongs To a catalog 
  def catalog_items(catalog_id)
    #Uset this only if you have multiple catalogs
    Catalog.joins(:categories => :items).where(:catalogs => {:id => catalog_id}).count
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
