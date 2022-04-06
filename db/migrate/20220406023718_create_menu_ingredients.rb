class CreateMenuIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :menu_ingredients do |t|
      t.references :menu, foregin_key: true
      t.references :ingredient, foregin_key: true
      t.timestamps
    end
  end
end
