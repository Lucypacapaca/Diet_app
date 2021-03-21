class Cooks::RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
   
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to cooks_recipe_url(@recipe), notice: "レシピ「#{@recipe.name}」を登録しました"
    else
      render :new
    end
  end

  def index
    @q = Food.ransack(params[:q])
    @foods = @q.result(distinct: true).page(params[:page])
  end
  
  private

  def recipe_params
    params.require(:recipe).permit(:name, :protein, :fat, :carbon_hydrate, :kcal, :amount)
  end

end
