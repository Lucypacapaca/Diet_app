class ChangeDataStartTimeToCook < ActiveRecord::Migration[5.2]
  def up
    change_column :cooks, :start_time, :date
  end
end
