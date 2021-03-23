class Admin::OrderProductsController < ApplicationController

  def update
    order_product = OrderProduct.find(params[:id])
    order = OrderProduct.order
    order_product.update(order_product_params)
    redirect_to admin_order_path(order.id)
  end

end
