class CustomersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @table_data = CustomersTableData.new(params[:page])
  end
end