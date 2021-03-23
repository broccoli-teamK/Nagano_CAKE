class Admin::OrderProductsController < ApplicationController

  def update
    order_product = OrderProduct.find(params[:id])
    order = order_product.order.id
    order_product.update(order_product_params)

    if order_product.product_making?
      order_product.order.update_attribute(:order_status, 2)
      redirect_to admin_order_path(order)
    else
      redirect_to admin_order_path(order)
    end

  end

  private
  def order_product_params
  params.require(:order_product).permit(:product_status)
  end

  def order_params
    params.require(:order).permit(:order_status)
  end

end
