class Food < ApplicationRecord
    belongs_to :cooks

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
