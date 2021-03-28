class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  
  def top

    if params[:format].present?
      @orders = Order.where(customer_id: params[:format]).page(params[:page]).per(10)
    else
      @orders = Order.all.page(params[:page]).per(10)
    end
    
  end
end
