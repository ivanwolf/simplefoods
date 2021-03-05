class Order < ApplicationRecord
  belongs_to :custumer
  belongs_to :workday

  has_many :order_products, dependent: :destroy

  accepts_nested_attributes_for :order_products
  accepts_nested_attributes_for :custumer
end