class Cooks::FoodsController < ApplicationController
  def new
    @food = Food.new
    @q = current_user.foods.ransack(params[:q])
    @foods = @q.result(distinct: true).recent
  end

  def create
    @food = Food.new(food_params)

    if @food.save
      redirect_to cooks_food_url(@food), notice: "レシピ「#{@food.name}」を登録しました"
    else
      render :new
    end
  end

  def index
    
  end

  private

  def food_params
    params.require(:food).permit(:name, :protein, :fat, :carbon_hydrate, :kcal, :amount)
  end
end
