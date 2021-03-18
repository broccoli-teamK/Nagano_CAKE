class Admin::ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product  = Product.new(product_paramas)
    @product.save
    redirect_to admin_products_path(@product)
  end

  def show
    @products = Product.find(params[:id])
  end

  def edit
  end

  def update
  end


 private
  def product_params
    params.require(:products).permit(:genre_id, :name, :introduction, :price, :image_id,:sales_status)
  end
end
