class CreateCooks < ActiveRecord::Migration[5.2]
  def change
    create_table :cooks do |t|
      t.string :name,null:false
      t.float :protein, null: false, :default => 1
      t.float :fat, null: false, :default => 1
      t.float :carbon_hydrate, null: false, :default => 1
      t.float :kcal, null: false, :default => 1
      t.float :amount, null: false, :default => 1
      t.string :description, null: false
      t.text :memo

      t.timestamps
    end
  end
end
