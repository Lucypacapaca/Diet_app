class Food < ApplicationRecord
    has_many :cooks, through: :cook_foods
    has_many :cook_foods
    accepts_nested_attributes_for :cook_foods
    paginates_per 100

    def self.csv_attributes
        ["name", "protein", "fat", "carbon_hydrate", "kcal"]
    end

    def self.import(file)
        CSV.foreach('eiyo.csv', headers: true) do |row|
            food = new
            food.attributes = row.to_hash.slice(*csv_attributes)
            food.save!
        end
    end
end
