class CustomersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @customers = Customer.page(params[:page]).per(20)
    @counter = CustomerOrderCounter.new @customers
  end
end