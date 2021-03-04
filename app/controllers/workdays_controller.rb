class WorkdaysController < ApplicationController
  def index
    @workdays = Workday.all
  end

  def new
    @workday = Workday.new(work_date: Date.today)
  end

  def create
    @product = Workday.new(product_params)
    # if @product.save
    #   redirect_to products_path
    # else
    #   render :new
    # end
  end

  private

  def product_params
    params.require(:product).permit(
    %i[name price]
    )
  end
end