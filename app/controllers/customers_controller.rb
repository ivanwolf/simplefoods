class CustomersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @table= CustomersTable.new(params[:page])
  end

  def destroy
    @customer = Customer.find(params[:id])

    if @customer.destroy 
      redirect_to customers_path, flash: { notice: I18n.t("activerecord.messages.models.customer.actions.destroy") }
    else
      redirect_to customers_path, flash: { error: I18n.t("activerecord.errors.models.customer.actions.destroy") }
    end
  end
end