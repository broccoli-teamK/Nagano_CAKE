class Public::ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
  end

  def index
    @products = Product.all.page(params[:page]).per(8)
  end
  
  private
  def products_params
    params.require(:product).permit(:genre, :name, :introduction, :price, :image, :sales_status)
  end
end
