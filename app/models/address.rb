class Address < ApplicationRecord

  belongs_to :customer
  
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :address_name, presence: true
  
  def full_address
    "〒" + self.postal_code + " " + self.address + " " + self.address_name
  end
end
