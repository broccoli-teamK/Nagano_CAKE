class Product < ApplicationRecord


attachment :image_id
  
  belongs_to :genre

  has_many :cart_products, dependent: :destroy
  has_many :order_products, dependent: :destroy

end


