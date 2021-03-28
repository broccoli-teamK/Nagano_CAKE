class Address < ApplicationRecord
   validates :customer_id, presence: true
   validates :postal_code, presence: true
   validates :address, presence: true
   validates :address_name, presence: true
 
  belongs_to :customer

  def full_address
    "〒" + self.postal_code + " " + self.address + " " + self.address_name
  end
end
