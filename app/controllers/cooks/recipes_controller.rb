class Cooks::RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def show
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
      redirect_to cooks_recipe_path(@recipe), notice: "レシピ「#{@recipe.name}」を登録しました"
    else
      render :new
    end
  end

  def index
    @recipe = Recipe.all
  end
  
  private

  def recipe_params
    params.require(:recipe).permit(:name, :protein, :fat, :carbon_hydrate, :kcal, :amount)
  end

end
