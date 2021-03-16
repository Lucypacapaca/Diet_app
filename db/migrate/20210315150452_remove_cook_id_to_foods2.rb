class RemoveCookIdToFoods2 < ActiveRecord::Migration[5.2]
  def up
    remove_reference :foods, :cook, index: true
    execute 'DELETE FROM foods;'
  end

  def down
    remove_reference :foods, :cook, index: true
  end
end
