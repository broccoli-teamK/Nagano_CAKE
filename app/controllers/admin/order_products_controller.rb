class Admin::OrderProductsController < ApplicationController

  def update
    order_product = OrderProduct.find(params[:id])
    order = order_product.order.id
    order_product.update(order_product_params)

    if  order_product.product_status == "making"

      order_product.order.update(order_status: "making")
      redirect_to admin_order_path(order)

    elsif order_product.order.order_products.count == order_product.order.order_products.where(product_status: "completed").count

      order_product.order.update(order_status: "preparing")
      redirect_to admin_order_path(order)

    else
      order_product.update(order_product_params)
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
