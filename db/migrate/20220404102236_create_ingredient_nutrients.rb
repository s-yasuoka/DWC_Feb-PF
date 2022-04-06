class CreateIngredientNutrients < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredient_nutrients do |t|
      t.references :nutrient, foregin_key: true
      t.references :ingredient, foregin_key: true
      t.timestamps
    end
  end
end
