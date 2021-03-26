class Product < ApplicationRecord
  belongs_to :genre

  has_many :cart_products, dependent: :destroy
  has_many :order_products, dependent: :destroy

  attachment :image
  
  validates :genre_id, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :sales_status, presence: true
  
  def tax_included_price
    self.price * 1.1
  end
  
end


