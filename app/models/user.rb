class User < ApplicationRecord
    has_secure_password
    
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true

    with_options numericality: true do
        validates :body_mass
        validates :body_fat_percentage
        validates :tall
        validates :age
    end

    has_many :cooks

    #base_cal = (10 * body_mass) + (6.25 * tall) - (5 * age) + 5
    #base_cal = { (10 * body_mass) + (6.25 * tall) - (5 * age) + 5 }

    # def require_kcal
    #     if sex == '1'
    #         if purpose == '1'
    #             if activity_level == '1'
    #                 ( (10 * body_mass) + (6.25 * tall) - (5 * age) + 5 ) * 1.725 * 1.2
    #             elsif activity_level == '2'
    #                 ( (10 * body_mass) + (6.25 * tall) - (5 * age) + 5 ) * 1.55 * 1.2
    #             else
    #                 ( (10 * body_mass) + (6.25 * tall) - (5 * age) + 5 ) * 1.2 * 1.2
    #             end
    #         elsif purpose == '2'
    #             if activity_level == '1'
    #                 ( (10 * body_mass) + (6.25 * tall) - (5 * age) + 5 ) * 1.725
    #             elsif activity_level == '2'
    #                 ( (10 * body_mass) + (6.25 * tall) - (5 * age) + 5 ) * 1.55
    #             else
    #                 ( (10 * body_mass) + (6.25 * tall) - (5 * age) + 5 ) * 1.2
    #             end
    #         else 
    #             if activity_level == '1'
    #                 ( (10 * body_mass) + (6.25 * tall) - (5 * age) + 5 ) * 1.725 * 0.8
    #             elsif activity_level == '2'
    #                 ( (10 * body_mass) + (6.25 * tall) - (5 * age) + 5 ) * 1.55 * 0.8
    #             else
    #                 ( (10 * body_mass) + (6.25 * tall) - (5 * age) + 5 ) * 1.2 * 0.8
    #             end
    #         end
    #     else
    #         if purpose == '1'
    #             if activity_level == '1'
    #                 ( (10 * body_mass) + (6.25 * tall) - (5 * age) - 161 ) * 1.725 * 1.2
    #              elsif activity_level == '2'
    #                 ( (10 * body_mass) + (6.25 * tall) - (5 * age) - 161 ) * 1.55 * 1.2
    #              else
    #                 ( (10 * body_mass) + (6.25 * tall) - (5 * age) - 161 ) * 1.2 * 1.2
    #              end
    #         elsif purpose == '2'
    #             if activity_level == '1'
    #                 ( (10 * body_mass) + (6.25 * tall) - (5 * age) - 161 ) * 1.725
    #              elsif activity_level == '2'
    #                 ( (10 * body_mass) + (6.25 * tall) - (5 * age) - 161 ) * 1.55
    #              else
    #                 ( (10 * body_mass) + (6.25 * tall) - (5 * age) - 161 ) * 1.2
    #              end
    #         else 
    #             if activity_level == '1'
    #                 ( (10 * body_mass) + (6.25 * tall) - (5 * age) - 161 ) * 1.725 * 0.8
    #              elsif activity_level == '2'
    #                 ( (10 * body_mass) + (6.25 * tall) - (5 * age) - 161 ) * 1.55 * 0.8
    #              else
    #                 ( (10 * body_mass) + (6.25 * tall) - (5 * age) - 161 ) * 1.2 * 0.8
    #              end
    #         end
    #     end
    # end

    # def require_protein
    #     body_mass * 2
    # end

    # def require_fat
    #     require_kcal * 0.25 / 9
    # end

    # def require_carbon_hydrate
    #       (require_kcal - (require_protein * 4) - (require_fat * 9) ) / 4
    # end



    def bm_male
        if activity_level == '1'
            ( (10 * body_mass) + (6.25 * tall) - (5 * age) + 5 ) * 1.725
        elsif activity_level == '2'
            ( (10 * body_mass) + (6.25 * tall) - (5 * age) + 5 ) * 1.55
        else
            ( (10 * body_mass) + (6.25 * tall) - (5 * age) + 5 ) * 1.2
        end
    end

    def bm_female
        if activity_level == '1'
           ( (10 * body_mass) + (6.25 * tall) - (5 * age) - 161 ) * 1.725
        elsif activity_level == '2'
           ( (10 * body_mass) + (6.25 * tall) - (5 * age) - 161 ) * 1.55
        else
           ( (10 * body_mass) + (6.25 * tall) - (5 * age) - 161 ) * 1.2
        end
    end

    def require_kcal
        if sex == 1
            if purpose == '1'
                bm_male * 1.2
            elsif purpose == '2'
                bm_male * 1
            else 
                bm_male * 0.8
            end
        else
            if purpose == '1'
                bm_female * 1.2
            elsif purpose == '2'
                bm_female * 1
            else 
                bm_female * 0.8
            end
        end
    end

    def require_protein
        body_mass * 2
    end

    def require_fat
        require_kcal * 0.25 / 9
    end

    def require_carbon_hydrate
          (require_kcal - (require_protein * 4) - (require_fat * 9) ) / 4
    end




end
