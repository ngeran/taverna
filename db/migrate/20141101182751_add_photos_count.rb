class AddPhotosCount < ActiveRecord::Migration
  def self.up
    add_column :albums, :photos_count, :integer, :default => 0
    Album.reset_column_information
    Album.find_each do |u|
      Album.reset_counters u.id, :photos
    end
  end
  def self.down
    drop_table :albums, :photos_count
  end
end
