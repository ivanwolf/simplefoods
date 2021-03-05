class OrdersController < ApplicationController
  layout 'public'
  
  def new
    @order = Order.new
    @workday = Workday.includes(:products).find(params[:workday_id])

    @workday.products.each do |product|
      @order.order_products << OrderProduct.new(product: product)
    end
  end
end