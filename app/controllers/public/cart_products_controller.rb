class Public::CartProductsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_products = current_customer.cart_products

    @total_price = 0
    @cart_products.each do |cp|
      # @total_price = @total_price + (cp.quantity * cp.product.price)
      @total_price += cp.quantity * cp.product.tax_included_price.to_i
    end
  end

  def create
    @cart_product = CartProduct.new(cart_product_params)
    @cart_product.customer_id = current_customer.id
    @cart_products = current_customer.cart_products.all
    @cart_products.each do |cart_product|
      if cart_product.product_id == @cart_product.product_id
        new_quantity = cart_product.quantity + @cart_product.quantity
        cart_product.update_attribute(:quantity, new_quantity)
        @cart_product.delete
      end
    end
    @cart_product.save
    redirect_to cart_products_path
  end

  def update
    cart_product = CartProduct.find(params[:id])
    cart_product.update(quantity_params)
    redirect_to cart_products_path
  end

  def destroy
    @cart_product = CartProduct.find(params[:id])
    @cart_product.destroy
    redirect_to cart_products_path
  end

  def destroy_all
    @cart_products = CartProduct.all
    @cart_products.destroy_all
    redirect_to products_path
  end

  private
  def quantity_params
    params.require(:cart_product).permit(:quantity)
  end
  def cart_product_params
    params.require(:cart_product).permit(:product_id, :costomer_id,:quantity)
  end
end
