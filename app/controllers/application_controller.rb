class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :require_protein
    helper_method :require_fat
    helper_method :require_carbon_hydrate
    helper_method :require_kcal
    #before_action :login_required
    #protect_from_forgery with: :null_session



    unless  :tall.blank? || :age.blank? || :body_mass.blank? || :sex.blank? || :activity_level.blank? || :purpose.blank?
        def bm_male
            if @current_user.activity_level== '1'
                ( (10 * @current_user.body_mass) + (6.25 * @current_user.tall) - (5 * @current_user.age) + 5 ) * 1.725
            elsif @current_user.activity_level == '2'
                ( (10 * @current_user.body_mass) + (6.25 * @current_user.tall) - (5 * @current_user.age) + 5 ) * 1.55
            else
                ( (10 * @current_user.body_mass) + (6.25 * @current_user.tall) - (5 * @current_user.age) + 5 ) * 1.2
            end
        end

        def bm_female
            if @current_user.activity_level == '1'
                ( (10 * @current_user.body_mass) + (6.25 * @current_user.tall) - (5 * @current_user.age) - 161 ) * 1.725
            elsif @current_user.activity_level == '2'
                ( (10 * @current_user.body_mass) + (6.25 * @current_user.tall) - (5 * @current_user.age) - 161 ) * 1.55
            else
                ( (10 * @current_user.body_mass) + (6.25 * @current_user.tall) - (5 * @current_user.age) - 161 ) * 1.2
            end
        end

        def require_kcal
            if @current_user.sex == 1
                if @current_user.purpose == '1'
                    bm_male * 1.2
                elsif @current_user.purpose == '2'
                    bm_male * 1
                else 
                    bm_male * 0.8
                end
            else
                if @current_user.purpose == '1'
                    bm_female * 1.2
                elsif @current_user.purpose == '2'
                    bm_female * 1
                else 
                    bm_female * 0.8
                end
            end
        end

        def require_protein
            #current_user.@current_user.body_mass * 2
            @current_user.body_mass * 2
        end

        def require_fat
            require_kcal * 0.25 / 9
        end

        def require_carbon_hydrate
            (require_kcal - (require_protein * 4) - (require_fat * 9) ) / 4
        end
    end
    

    private

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def login_required
        redirect_to login_url unless current_user
    end

    # def cal_proten
    #     @cal_proten = :protein * :amount / 100
    # end

    # def cal_fat
    #     @cal_fat = :fat * :amount / 100
    # end

    # def cal_carbon_hydrate
    #     @cal_carbon_hydrate = :carbon_hydrate * 100 / :amount
    # end

    # def cal_kcal
    #     @cal_kcal = cal_proten*4 + cal_fat*9 + cal_carbon_hydrate*4
    # end

    





end
