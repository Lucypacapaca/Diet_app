class AddSelectDayToCooks < ActiveRecord::Migration[5.2]
  def change
    add_column :cooks, :select_day, :datetime
  end
end
