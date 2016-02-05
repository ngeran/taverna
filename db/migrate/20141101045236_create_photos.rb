class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :album_id
      t.string :image
      t.string :title
      t.text :description
      t.string :content_type
      t.string :file_size
      t.integer :uploaded_by

      t.timestamps
    end
  end
end
