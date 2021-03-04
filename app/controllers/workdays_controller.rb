class WorkdaysController < ApplicationController
  def index
    @workdays = Workday.all
  end

  def show
    @workday = Workday.find(params[:id])
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

  private

  def workday_params
    params.require(:workday).permit(:work_date)
  end
end