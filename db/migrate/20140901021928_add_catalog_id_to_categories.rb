class AddCatalogIdToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :catalog_id, :integer
  end
end
