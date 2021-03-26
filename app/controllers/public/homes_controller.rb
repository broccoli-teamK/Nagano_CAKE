class Public::HomesController < ApplicationController
  def top
    @top = Product.limit(3).order(" created_at DESC ")
  end

  def about
  end
end
