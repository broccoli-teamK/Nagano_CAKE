class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_products, dependent: :destroy
  
  validates :payment_method, presence: true
  validates :shipping_postal_code, presence: true
  validates :shipping_address, presence: true
  validates :shipping_name, presence: true

  enum payment_method: { credit: 0, bank: 1}

  enum order_status: {
    waiting: 0,
    paid_up: 1,
    making: 2,
    preparing: 3,
    shipped: 4
  }

  def total
    total = 0
    self.order_products.each do |order_product|
      total += order_product.sub_total
    end
    total
  end

end
