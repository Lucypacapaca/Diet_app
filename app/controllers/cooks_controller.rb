class CooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @cook = Cook.new
  end
  
  def index
    @cooks = Cook.all
  end

  def show
  end

  def edit
  end

  def create
    cook = Cook.new(cook_params)
    cook.save!
    redirect_to cooks_url, notice: "登録しました"
  end

  private

  def cook_params
    params.require(:cook).permit(:name, :description, :protein, :fat, :carbon_hydrate, :amount)
  end

  
end
