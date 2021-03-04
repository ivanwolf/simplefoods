class Workday < ApplicationRecord
  has_many :workday_products
  has_many :products, through: :workday_products
end