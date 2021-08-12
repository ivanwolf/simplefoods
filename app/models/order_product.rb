# == Schema Information
#
# Table name: order_products
#
#  id                 :bigint           not null, primary key
#  order_id           :bigint           not null
#  quantity           :integer          not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  store_id           :bigint           not null
#  workday_product_id :bigint           not null
#  unit_price         :integer
#
class OrderProduct < ApplicationRecord
  acts_as_tenant :store

  belongs_to :order
  belongs_to :workday_product, optional: true

  validates :quantity, presence: true
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }

  delegate :name, :cover_photo, :delivery_time, to: :workday_product

  def price
    workday_product.price * quantity
  end
end
