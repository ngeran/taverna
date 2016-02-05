class Category < ActiveRecord::Base
  belongs_to :catalog
  has_many :items
  
   #CSV Method
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |category|
        csv << category.attributes.values_at(*column_names)
      end
    end
  end
  
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      category = find_by_id(row["id"]) || new
      category.attributes = row.to_hash.slice(*Category.attribute_names())
      category.save!
    end
  end
end
