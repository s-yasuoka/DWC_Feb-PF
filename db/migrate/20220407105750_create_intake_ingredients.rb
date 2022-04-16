class CreateIntakeIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :intake_ingredients do |t|
      t.references :intake, foregin_key: true
      t.references :ingredient, foregin_key: true
      t.timestamps
    end
  end
end
