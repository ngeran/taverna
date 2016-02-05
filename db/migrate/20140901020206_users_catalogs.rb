class UsersCatalogs < ActiveRecord::Migration
 def self.up
    create_table :user_catalogs do |t|
      t.belongs_to :user
      t.belongs_to :catalog
      t.timestamps
    end
  end
 
  def self.down
    drop_table :user_catalogs
  end
end