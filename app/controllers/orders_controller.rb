class OrdersController < ApplicationController
  layout 'public'
  
  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.order_products = @order.order_products.select { |op| op.quantity.positive? }
      @order.save
      redirect_to @order
    else
      @workday = @order.workday
      render :new
    end
  end

  def destroy
    @order = Order.find(params[:id])

    @order.destroy!

    redirect_to workday_path(@order.workday)
  end

  private

  def order_params
    params.require(:order).permit(
      :workday_id, :delivery_comment,
      order_products_attributes: [:product_id, :quantity],
      customer_attributes: [:name, :last_name, :phone_number, :address, :apartment]
    )
  end
end