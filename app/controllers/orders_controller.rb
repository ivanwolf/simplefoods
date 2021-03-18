class OrdersController < ApplicationController
  layout 'public'
  
  def show
    @order = Order.find(params[:id])
  end

  def destroy
    @order = Order.find(params[:id])

    @order.destroy!

    redirect_to workday_path(@order.workday)
  end

end