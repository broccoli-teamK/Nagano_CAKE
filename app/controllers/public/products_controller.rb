class Public::ProductsController < ApplicationController
  before_action :authenticate_customer!,except: [:index, :show]
  
  def show
    @cart_product = CartProduct.new
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
