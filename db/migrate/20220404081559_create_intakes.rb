class CreateIntakes < ActiveRecord::Migration[6.1]
  def change
    create_table :intakes do |t|
      t.integer :user_id, null: false
      t.integer :menu_id, null: false
      t.integer :status, null: false
      t.datetime :eat_day, null: false
      t.text :memo
      t.timestamps
    end
  end
end
