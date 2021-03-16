class CreateCookFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :cook_foods do |t|
      t.references :cook, index: true
      t.references :food, index:true
      t.timestamps
    end
  end
end
