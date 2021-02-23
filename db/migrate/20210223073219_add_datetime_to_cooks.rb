class AddDatetimeToCooks < ActiveRecord::Migration[5.2]
  def change
    add_column :cooks, :start_time, :datetime
  end
end
