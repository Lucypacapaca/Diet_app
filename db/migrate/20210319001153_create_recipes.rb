class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name, null: false
      t.integer :kcal, null: false
      t.float :protein, null: false
      t.float :fat, null: false
      t.float :carbon_hydrate, null: false
      t.float :amount, null: false

      t.timestamps
    end
  end
end
