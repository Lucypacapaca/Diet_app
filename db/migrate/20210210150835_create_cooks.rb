class CreateCooks < ActiveRecord::Migration[5.2]
  def change
    create_table :cooks do |t|
      t.string :name
      t.float :protein
      t.float :fat
      t.float :carbon_hydrate
      t.float :kcal
      t.float :amount
      t.string :description
      t.integer :date
      t.text :memo

      t.timestamps
    end
  end
end
