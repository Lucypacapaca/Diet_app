class Cooks::FoodsController < ApplicationController
  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)

    if @food.save
      redirect_to cooks_foods_path, notice: "食材「#{@food.name}」を登録しました"
    else
      render :new
    end
  end

  def show
  end

  def index
    @q = Food.ransack(params[:q])
    @foods = @q.result(distinct: true).page(params[:page])
    #@foods = Food.all.page(params[:page])
  end

  # def search
  #   @q = Food.search(search_params)
  #   @foods = @q.result(distinct: true)
  # end

  def import
    foods.import(params[:file])
    render :new, notice: "食材を追加しました"
  end

  private

  def food_params
    params.require(:food).permit(:name, :protein, :fat, :carbon_hydrate, :kcal, :amount)
  end

  # def search_params
  #   params.require(:q).permit!
  # end
end
