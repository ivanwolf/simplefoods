class FriendlyOrdersController < ApplicationController
  layout 'public'

  def show
    @order = Order.find(params[:id])
  end
  
  def new
    @order = Order.new
    @order.build_customer
    @workday = Workday.by_slug(params[:slug], params[:date]).first

    @workday.workday_products.each do |workday_product|
      @order.order_products << OrderProduct.new(workday_product: workday_product, quantity: 0)
    end
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.order_products = @order.order_products.select { |op| op.quantity.positive? }
      @order.customer = Customer.find_by_phone_number(@order.customer.phone_number) || @order.customer.phone_number
      @order.save
      redirect_to @order
    else
      @workday = @order.workday
      render :new
    end
  end

  private

  def find_current_tenant
    set_current_tenant(Store.find_by_slug(params[:slug]))
  end

  def order_params
    params.require(:order).permit(
      :workday_id, :delivery_comment,
      order_products_attributes: [:workday_product_id, :quantity],
      customer_attributes: [:name, :last_name, :phone_number, :address, :apartment]
    )
  end
end