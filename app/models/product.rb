class Product < ApplicationRecord
  validates :genre_id, presence: true
  validates :name, presence: true
  validates :price, presence: true
  validates :sales_status, presence: true

  belongs_to :genre

  has_many :cart_products, dependent: :destroy
  has_many :order_products, dependent: :destroy

  attachment :image

  def tax_included_price
    self.price * 1.1
  end

end


