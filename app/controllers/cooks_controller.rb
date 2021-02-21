class CooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @cooks = Cook.all
  end

  def show
    @cook = Cook.find(params[:id])
  end

  def new
    @cook = Cook.new
  end

  def edit
    @cook = Cook.find(params[:id])
  end
  
  def update
    cook = Cook.find(params[:id])
    cook.update!(cook_params)
    redirect_to cooks_url
  end

  def destroy
    cook = Cook.find(params[:id])
    cook.destroy
    redirect_to cooks_url
  end

  def create
    @cook = Cook.new(cook_params)
    @cook.save!
    redirect_to cooks_url
  end

  def search
    #@q = cooks.ransack[params[:q]]
    #@cooks = @q.result(distinct: true).recent
  end

  private

  def cook_params
    params[:cook].permit(:name, :description, :protein, :fat, :carbon_hydrate, :amount)
  end

  def cook_kcal
    cook_params.merge(@cook.kcal)
  end


end
