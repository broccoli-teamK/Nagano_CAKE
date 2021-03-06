class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  def show
   @customer = current_customer
  end

  def confirm
    @customer = current_customer
  end

  def withdraw
    customer = current_customer
    
    if customer.update(customer_status: false)
      reset_session
      redirect_to root_path
    else
      render :confirm
    end
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customers_my_page_path(@customer)
    else
      render :edit
    end
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:email,:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:address,:phone_number)
  end
end
