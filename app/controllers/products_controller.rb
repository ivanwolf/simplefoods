class ProductsController < ApplicationController
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

  def destroy
    @product = Product.find(params[:id])

    @product.destroy!

    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(
      %i[name price cover_photo]
    )
  end
end