class FriendlyOrdersController < ApplicationController
  layout 'public'

  def show
    @order = Order.find(params[:id])
  end
  
  def new
    @order = Order.new
    @order.build_customer
    @workday = Workday.by_slug(params[:slug], params[:date]).includes(:products).first

    @workday.products.each do |product|
      @order.order_products << OrderProduct.new(product: product, quantity: 0)
    end
  end
end