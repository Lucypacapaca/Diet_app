class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :kcal
      t.float :protein
      t.float :fat
      t.float :carbon_hydrate

      t.timestamps
    end
  end
end
