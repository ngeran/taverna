class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
