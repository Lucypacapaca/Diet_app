class ChangeDataKcalToRecipe < ActiveRecord::Migration[5.2]
  def change
    change_column :recipes, :kcal, :float
  end
end
