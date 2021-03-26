class Genre < ApplicationRecord
  validates :genre_name, presence: true

  has_many :products
  
  validates :genre_name, presence: true

end
