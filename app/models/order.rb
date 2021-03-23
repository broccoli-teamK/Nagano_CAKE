class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_products, dependent: :destroy


  enum payment_method: { "クレジットカード": 0, "銀行振込": 1}




  def total
    total = 0
    self.order_products.each do |order_product|
      total += order_product.sub_total
    end
    total
  end

  enum order_status: {
    waiting: 0,
    paid_up: 1,
    making: 2,
    preparing: 3,
    shipped: 4
  }

end
