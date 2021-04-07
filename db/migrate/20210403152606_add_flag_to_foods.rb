class AddFlagToFoods < ActiveRecord::Migration[5.2]
  def change
    add_column :foods, :flag, :boolean, default: false
  end
end
