class ProductsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    @product.assign_attributes(product_params)

    if @product.save
      redirect_to products_path, flash: { notice: I18n.t("activerecord.messages.models.product.actions.update") }
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])

    if @product.destroy 
      redirect_to products_path, flash: { notice: I18n.t("activerecord.messages.models.product.actions.destroy") }
    else
      redirect_to products_path, flash: { error: I18n.t("activerecord.errors.models.product.actions.destroy") }
    end
  end

  private

  def product_params
    params.require(:product).permit(
      %i[name price cover_photo published]
    )
  end
end