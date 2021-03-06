class ChangeDataCreatedAtToCooks < ActiveRecord::Migration[5.2]
  def change
    change_column :cooks, :updated_at, :date
  end
end
