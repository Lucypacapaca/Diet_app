class AddAmountToFoods < ActiveRecord::Migration[5.2]
  def change
    add_column :foods, :amount, :float
  end
end
