class OrdersController < ApplicationController
  before_action :authenticate_user!, only: %i[index]
  
  layout 'public', except: %i[index]

  def index
    @orders = Order.order(created_at: :desc).page(params[:page])
  end

  def new
    @order = Order.new
    setup_order
  end

  def create
    @order = Order.new(order_params)
    
    if @order.valid?
      @order.customer = find_customer
      @order.save

      redirect_to @order
    else
      byebug
      render :new
    end
  end
  
  def show
    @order = Order.find(params[:id])
  end

  def destroy
    @order = Order.find(params[:id])

    @order.destroy!

    redirect_to workday_path(@order.workday)
  end

  private

  def find_customer
    Customer.find_by_phone_number(@order.customer.phone_number) || @order.customer
  end

  def setup_order
    @order.build_customer

    Product.kept.published.each do |product|
      @order.order_products.build(quantity: 0, product: product)
    end
  end

  def order_params
    params.require(:order).permit(
      :delivery_comment,
      order_products_attributes: [:quantity, :product_id],
      customer_attributes: [:name, :last_name, :phone_number, :address, :apartment]
    )
  end
end