class CustomersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @customers = Customer.all
    @counter = CustomerOrderCounter.new @customers
  end
end