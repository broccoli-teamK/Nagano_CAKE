class Admin::HomesController < ApplicationController
  def top

    if params[:format].present?
      @orders = Order.where(customer_id: params[:format])
    else
      @orders = Order.all
    end

  end
end
