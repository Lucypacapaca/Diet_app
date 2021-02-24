class AddUserIdToCooks < ActiveRecord::Migration[5.2]
  def up
    execute 'DELETE FROM cooks;'
    add_reference :cooks, :user, null: false, index: true
  end

  def down
    remove_reference :cooks, :user, index: true
  end
end
