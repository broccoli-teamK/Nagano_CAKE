class OrderProduct < ApplicationRecord
  validates :order_id, presence: true
  validates :product_id, presence: true
  validates :quantity, presence: true
  validates :product_status, presence: true
  validates :tax_in_price, presence: true

  belongs_to :product
  belongs_to :order

  enum product_status: {
    not_start: 0,
    waiting: 1,
    making: 2,
    completed: 3
  }

  def sub_total
    quantity * tax_in_price
  end


end
