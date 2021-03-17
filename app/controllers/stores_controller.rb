class StoresController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @store = Store.find(params[:id])
  end
end