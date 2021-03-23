class OrderProduct < ApplicationRecord

  belongs_to :product
  belongs_to :order


  def sub_total
    quantity * tax_in_price
  end

  enum product_status: {
    not_start: 0,
    waiting: 1,
    making: 2,
    completed: 3
  }

end
