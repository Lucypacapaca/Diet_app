class RemoveDescriptionFromCooks < ActiveRecord::Migration[5.2]
  def up
    remove_column :cooks, :description
      end

  def down
    add_column :cooks, :description, :string
  end
end
