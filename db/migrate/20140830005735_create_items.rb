class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :titlegr
      t.string :titleen
      t.decimal :price,:precision => 8, :scale => 2
      t.integer :category_id

      t.timestamps
    end
  end
end
