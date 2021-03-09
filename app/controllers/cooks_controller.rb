class CooksController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_cook, only: [:show, :edit, :update, :destroy]

  def index
    unless params[:date].blank?
      if params[:date][:month].to_i < 10
        start_time_month = "0" + params[:date][:month]
      end

      if params[:date][:day].to_i < 10
        start_time_day = "0" + params[:date][:day]
      end

      start_time_string_date = (params[:date][:year] + "-" + start_time_month + "-" + start_time_day).to_date
      @cooks = current_user.cooks.order(start_time: :desc).where(start_time: start_time_string_date)
      
    end

    logger.info(start_time_string_date)

  

    unless params[:date].blank?
      logger.debug(params[:date][:year])
      logger.debug(params[:date][:month])
      logger.debug(params[:date][:day])
      #logger.debug(params[:date])
    end

    unless :start_time.blank?
      #day = params[:start_time].to_i
      logger.info "ラーメン"
      #logger.info()
    end
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
    redirect_to cooks_url, notice: "食品「#{@cook.name}」を編集しました"
  end

  def destroy
    @cook.destroy
    redirect_to cooks_url, notice: "食品「#{@cook.name}」を削除しました"
  end

  def create
    @cook = current_user.cooks.new(cook_params)

    if @cook.save
      redirect_to new_cook_url, notice: "食品「#{@cook.name}」を登録しました"
    else
      render :new
    end
  end

  #def search
    #@q = cooks.ransack[params[:q]]
    #@cooks = @q.result(distinct: true).recent
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
