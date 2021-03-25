class Product < ApplicationRecord
  belongs_to :genre

  has_many :cart_products, dependent: :destroy
  has_many :order_products, dependent: :destroy

  attachment :image
  
  def tax_included_price
    self.price * 1.1
  end
  
end


