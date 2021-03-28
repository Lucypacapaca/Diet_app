class Food < ApplicationRecord
    has_many :recipes, through: :recipes_food
    has_many :recipes_food
    accepts_nested_attributes_for :recipes_food
    paginates_per 10

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
