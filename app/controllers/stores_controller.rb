class StoresController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @store = Store.find(params[:id])
  end
  
  def edit
    @store = Store.find(params[:id])
  end

  def update
    @store = Store.find(params[:id])

    @store.assign_attributes(store_params)

    if @store.save
      redirect_to @store, flash: { notice: I18n.t("activerecord.messages.models.store.actions.update") }
    else
      render :edit
    end
  end

  def store_params
    params.require(:store).permit(
      %i[name slug logo]
    )
  end
end