class CooksController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_cook, only: [:show, :edit, :update, :destroy]

  def index
    #params[:cook][:start_time] = cook_join
    #array_start_time = [Cook.start_time("%Y"), Cook.start_time("%-m"), Cook.start_time("%-d")]
    #@cooks = current_user.cooks.order(start_time: :desc).where("array_start_time = ?", params[:date])
    @cooks = current_user.cooks.order(start_time: :desc).find_by_sql("SELECT * FROM cooks WHERE updated_at = start_time ")
    #logger.debug(@cooks.start_time.to_date)

    unless params[:date].blank?
      logger.debug(params[:date][:year])
      logger.debug(params[:date][:month])
      logger.debug(params[:date][:day])
      #logger.debug(params[:date])
    end




    unless params[:start_time].blank?
      #day = params[:start_time].to_i
      logger.debug(prams[:start_time])
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

  # def cook_join
  #   cookday = params[:cook][:start_time]

  #   if cookday["start_time(1i)"].empty? && cookday["start_time(2i)"].empty? &&cookday["start_time(3i)"].empty? 
  #     return
  #   end

  #   Date.new cookday["start_time(i1)"].to_i, cookday["start_time(i2)"].to_i, cookday["start_time(i3)"].to_i

  # end


end
