class Product < ApplicationRecord

  has_many :genres, dependent: :destroy
  has_many :cart_products, dependent: :destroy
  has_many :order_products, dependent: :destroy

end
