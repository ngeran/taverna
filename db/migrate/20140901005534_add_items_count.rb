class AddItemsCount < ActiveRecord::Migration
    def self.up
  add_column :categories, :items_count, :integer, :default => 0
  Category.reset_column_information
  Category.find_each do |u|
    Category.reset_counters u.id, :items
  end
end
def self.down
  drop_table :categories, :items_count
end
end
