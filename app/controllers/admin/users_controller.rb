class Admin::UsersController < ApplicationController
  before_action :login_required, only: [:index, :edit, :update, :destroy]
  helper_method :bm_male, :bm_female, :require_kcal, :require_protein, :require_fat, :require_carbon_hydrate

  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_user_url(@user), notice: "ユーザー「#{@user.name}」を登録しました"
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to admin_user_url(@user), notice: "ユーザー「#{@user.name}」を更新しました"
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_url, notice: "ユーザー「#{@user.name}」を削除しました"
  end

  unless  :tall.blank? || :age.blank? || :body_mass.blank? || :sex.blank? || :activity_level.blank? || :purpose.blank?

    def bm_male
        if @user.activity_level == '1'
            ( (10 * @user.body_mass) + (6.25 * @user.tall) - (5 * @user.age) + 5 ) * 1.725
        elsif @user.activity_level == '2'
            ( (10 * @user.body_mass) + (6.25 * @user.tall) - (5 * @user.age) + 5 ) * 1.55
        else
            ( (10 * @user.body_mass) + (6.25 * @user.tall) - (5 * @user.age) + 5 ) * 1.2
        end
    end

    def bm_female
        if @user.activity_level == '1'
            ( (10 * @user.body_mass) + (6.25 * @user.tall) - (5 * @user.age) - 161 ) * 1.725
        elsif @user.activity_level == '2'
            ( (10 * @user.body_mass) + (6.25 * @user.tall) - (5 * @user.age) - 161 ) * 1.55
        else
            ( (10 * @user.body_mass) + (6.25 * @user.tall) - (5 * @user.age) - 161 ) * 1.2
        end
    end

    def require_kcal
        if @user.sex == 1
            if @user.purpose == '1'
                bm_male * 1.2
            elsif @user.purpose == '2'
                bm_male * 1
            else 
                bm_male * 0.8
            end
        else
            if @user.purpose == '1'
                bm_female * 1.2
            elsif @user.purpose == '2'
                bm_female * 1
            else 
                bm_female * 0.8
            end
        end
    end

    def require_protein
        @user.body_mass * 2
    end

    def require_fat
        require_kcal * 0.25 / 9
    end

    def require_carbon_hydrate
        (require_kcal - (require_protein * 4) - (require_fat * 9) ) / 4
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation, 
      :body_mass, :body_fat_percentage, :purpose, :activity_level, :tall, :age, :sex)
  end

  def require_admin
    redirect_to root_url unless current_user.admin?
  end
end
