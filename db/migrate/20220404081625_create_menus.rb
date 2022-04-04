class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus do |t|
      t.string :name, null: false
      t.integer :ingredient, null: false
      t.timestamps
    end
  end
end
