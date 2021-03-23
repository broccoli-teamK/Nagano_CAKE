class Admin::OrdersController < ApplicationController

  def show

    @order = Order.find(params[:id])
    @billing = @order.total + @order.postage

  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)

    if
      order_product = OrderProduct.where(:order_id, order.id)
      order_product.update_attributes(:order_status, "1")
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
