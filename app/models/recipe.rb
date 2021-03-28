class Recipe < ApplicationRecord
    paginates_per 10
    has_many :foods, through: :food_recipes
    has_many :food_recipes

    belongs_to :user

    with_options numericality: true do
        validates :protein
        validates :fat
        validates :carbon_hydrate
        validates :amount
    end

    # def kcal
    #     @kcal = 4*protein + 9*fat + 4*carbon_hydrate
    # end
end
