class CreateMainNavs < ActiveRecord::Migration
  def change
    create_table :main_navs do |t|
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
