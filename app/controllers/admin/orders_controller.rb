class Admin::OrdersController < ApplicationController

  def show

    @order = Order.find(params[:id])
    @billing = @order.total + @order.postage

  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)

  if order.order_status == "paid_up"

    order.order_products.each do |order_product|

      order_product.update(product_status: "waiting")

    end

    redirect_to admin_order_path(order.id)
  else
    redirect_to admin_order_path(order.id)
  end

  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end

  def order_product_params
  params.require(:order_product).permit(:product_status)
  end


end
