class Cook < ApplicationRecord
    def kcal
        4*protein + 9*fat + 4*carbon_hydrate
    end

    #def set_kcal
       # { kcal: kcal }
    #end
end
