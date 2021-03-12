class AddCookIdToFoods < ActiveRecord::Migration[5.2]
  def up
    execute 'DELETE FROM foods;'
    add_reference :foods, :cook, null: false, index: true
  end

  def down
    remove_reference :foods, :cook, index: true
  end
end
