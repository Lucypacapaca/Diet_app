class RecipesFood < ApplicationRecord
  belongs_to :food
  belongs_to :recipe

  def cal
    @cal_protein = protein * amount/100
    @cal_fat = fat * amount/100
    @cal_carbon_hydrate = carbon_hydrate * amount/100
    @cal_kcal = 4*cal_protein + 9*cal_fat + 4*cal_carbon_hydrate
end

end
