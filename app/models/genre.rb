class Genre < ApplicationRecord
  validates :genre_name, presence: true

  has_many :products

end
