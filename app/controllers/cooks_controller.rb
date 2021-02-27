class CooksController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_cook, only: [:show, :edit, :update, :destroy]

  def index
    #unless params[:start_time].blank?
      day = params[:start_time].to_s
      @cooks = current_user.cooks.order(start_time: :desc).where(:day == :start_time)
    #end
  end

  def show
 
  end

  def new
    @cook = Cook.new
  end

  def edit
  end
  
  def update
    @cook.update!(cook_params)
    redirect_to cooks_url
  end

  def destroy
    @cook.destroy
    redirect_to cooks_url
  end

  def create
    @cook = current_user.cooks.new(cook_params)

    if @cook.save
      redirect_to cooks_url
    else
      render :new
    end
  end

  def search
    #@q = cooks.ransack[params[:q]]
    #@cooks = @q.result(distinct: true).recent
  end

  #def cooklist
    #@cooklist = current_user.cooks.order(start_time: :desc)
  #end

  private

  def cook_params
    params.require(:cook).permit(:name, :protein, :fat, :carbon_hydrate, :amount, :start_time)
    
  end

  def cook_kcal
    cook_params.merge(@cook.kcal)
  end

  def set_cook
    @cook = current_user.cooks.find(params[:id])
  end


end
