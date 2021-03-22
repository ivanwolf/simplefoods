class WorkdaysController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @workdays = Workday.all
  end

  def show
    @workday = Workday.includes(:products).find(params[:id])
    @workday_products_table = WorkdayProductsTable.new @workday.id
  end

  def new
    @workday = Workday.new(work_date: Date.today)
  end

  def create
    @workday = Workday.new(workday_params)
    if @workday.save
      redirect_to @workday
    else
      render :new
    end
  end

  def destroy
    @workday = Workday.find(params[:id])

    @workday.destroy!

    redirect_to workdays_path
  end

  private

  def workday_params
    params.require(:workday).permit(:work_date)
  end
end