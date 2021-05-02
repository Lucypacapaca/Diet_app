class Cooks::RecipesController < ApplicationController
  def new
    
    @recipe = Recipe.new
    #@q = Food.ransack(params[:q])
    #@foods = @q.result(distinct: true).page(params[:page])
    @foods = Food.where('foods.name LIKE(?)', "%#{params[:food_search]}%").page(params[:page])
    #debugger
    @food_recipes = Food.where(flag: false)
  end

  def food_recipe_update
    @food_recipes.update!(food_recipe_params)
    redirect_to new_cooks_recipe_path
    debugger
  end

  def food_update_show
  end

  def food_search
    # @qf = Food.ransack(params[:qf])
    # @foods = @qf.result(distinct: true).page(params[:page])
    @foods = Food.where('foods.name LIKE(?)', "%#{params[:food_search]}%").page(params[:page])
    # @cal_protein = @food.protein * @food.params[:amount] / 100
    # @cal_fat = fat * amount / 100
    # @cal_carbon_hydrate = carbon_hydrate * amount / 100
    # @kcal = cal_protein * 4 + cal_fat * 9 + carbon_hydrate * 4
    @food_recipes = Food.where(flag: false)
    #@cal_protein = Food.select

    
    logger.info(Food.find_by(flag: false))
    logger.info(params[:flag])

    # @user_protein = require_protein.protein
    # @user_fat = require_fat.fat
    # @user_carbon_hydrate = require_carbon_hydrate.carbon_hydrate
    # @user_kcal = require_kcal.kcal

    unless params[:flag].blank?
      logger.debug(params[:flag])
    end

    if :flag == false
      #day = params[:start_time].to_i
      logger.info "ラーメン"
      #logger.info()
    end



  end

  def cal_protein
    @cal_protein = Food(:protein) * :amount /100
  end

  def food_search_update
    @food_recipes.update!(food_recipe_params)
    redirect_to new_cooks_recipe_path
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
  end
  
  def update
    @recipe.update!(recipe_params)
    redirect_to cooks_recipes_path, notice: "食品「#{@recipe.name}」を編集しました"
  end

  def destroy
    @recipe.destroy
    redirect_to cooks_recipes_path, notice: "食品「#{@recipe.name}」を削除しました"
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)

    if @recipe.save
      redirect_to cooks_recipes_path, notice: "レシピ「#{@recipe.name}」を登録しました"
    else
      render :new
    end
  end

  def index
    @q = Recipe.ransack(params[:q])
    @recipes = @q.result(distinct: true).page(params[:page])
  end
  
  private

  def recipe_params
    params.require(:recipe).permit(:name, :protein, :fat, :carbon_hydrate, :kcal, :amount)
  end

  def food_recipe_params
    params.require(:food_search).permit(:name, :protein, :fat, :carbon_hydrate, :kcal, :flag)
  end

  def set_recipe
    @recipe = current_user.recipes.find(params[:id])

  end

end
