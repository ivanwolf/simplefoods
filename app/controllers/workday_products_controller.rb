class WorkdayProductsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @workday = Workday.find(params[:workday_id])
    @workday_product = WorkdayProduct.new.tap do |wd_product|
      wd_product.workday = @workday
    end
  end

  def create
    @workday_product = WorkdayProduct.new(workday_product_paramas)
    if @workday_product.save
      redirect_to workday_path(@workday_product.workday)
    else
      render :new
    end
  end

  def edit
    # @workday = Workday.find(params[:workday_id])
    @workday_product = WorkdayProduct.find(params[:id])
  end

  def update
    @workday_product = WorkdayProduct.find(params[:id])

    @workday_product.assign_attributes(workday_product_paramas)

    if @workday_product.save
      redirect_to workday_path(@workday_product.workday), flash: { notice: I18n.t("activerecord.messages.models.workday_product.actions.update") }
    else
      render :edit
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
      %i[workday_id product_id stock deliver_time]
    )
  end
end