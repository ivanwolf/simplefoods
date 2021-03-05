class Product < ApplicationRecord
  validates :name, presence: true, allow_blank: false
  validates :price, numericality: { greater_than: 0 }

  has_many :workday_products, dependent: :destroy
end