class CreateIntakes < ActiveRecord::Migration[6.1]
  def change
    create_table :intakes do |t|
      t.integer :user_id, null: false
      t.integer :menu_id, null: false
      t.integer :ingredient_id, null: false
      t.integer :status, null: false, default: 4
      t.integer :eat_day, null: false
      t.text :memo
      t.timestamps
    end
  end
end
