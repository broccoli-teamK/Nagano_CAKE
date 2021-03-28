class Public::HomesController < ApplicationController
  def top
    @top = Product.where(sales_status: true).limit(3).order(" created_at DESC ")
  end

  def about
  end
end
