class Product < ApplicationRecord
  validates :name, presence: true, allow_blank: false
  validates :price, numericality: { greater_than: 0 }
end