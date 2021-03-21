class Address < ApplicationRecord

  belongs_to :customer
  
  def full_address
    "〒" + self.postal_code + " " + self.address + " " + self.address_name
  end
end
