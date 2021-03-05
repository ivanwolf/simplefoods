class OrdersController < ApplicationController
  layout 'public'
  
  def new
    @order = Order.new
    @workday = Workday.includes(:products).find(params[:workday_id])

    @workday.products.each do |product|
      @order.order_products << OrderProduct.new(product: product)
    end
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to @order
    else
      @workday = @order.workday
      render :new
    end
  end

  def order_params
    params.require(:order).permit(
      :workday_id, :delivery_comment,
      order_products_attributes: [:product_id, :quantity],
      customer_attributes: [:name, :last_name, :phone_number, :apartment]
    )
  end
end