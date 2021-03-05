class WorkdayProductsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @workday_product = WorkdayProduct.new
  end

  def create
    @workday_product = WorkdayProduct.new(workday_product_paramas)
    if @workday_product.save
      redirect_to workday_path(@workday_product.workday)
    else
      render :new
    end
  end

  def destroy
    @workday_product = WorkdayProduct.find(params[:id])

    @workday_product.destroy!

    redirect_to workday_path(@workday_product.workday)
  end

  private

  def workday_product_paramas
    params.require(:workday_product).permit(
      %i[workday_id product_id stock]
    )
  end
end