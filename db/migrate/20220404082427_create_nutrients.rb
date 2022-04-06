class CreateNutrients < ActiveRecord::Migration[6.1]
  def change
    create_table :nutrients do |t|
      t.string :name, null:false
      t.integer :nutritional_value, null:false
      t.timestamps
    end
  end
end
