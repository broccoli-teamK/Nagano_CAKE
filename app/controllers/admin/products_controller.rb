class Admin::ProductsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @products = Product.all.page(params[:page]).per(10)
  end

  def new
    @product = Product.new
    @genres = Genre.all
  end

  def create
    product = Product.new(product_params)
    if product.save
      redirect_to admin_product_path(product.id)
    else
      @product = Product.new
      @genres = Genre.all
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
    @genres = Genre.all
  end

  def update
    product = Product.find(params[:id])
    if product.update(product_params)
      redirect_to admin_product_path(product.id)
    else
      @product = Product.find(params[:id])
      @genres = Genre.all
      render :edit
    end
  end


 private
  def product_params
    params.require(:product).permit(:genre_id, :name, :introduction, :price, :image, :sales_status )
  end

end
