# == Schema Information
#
# Table name: order_products
#
#  id         :bigint           not null, primary key
#  product_id :bigint           not null
#  order_id   :bigint           not null
#  quantity   :integer          not null
#  created_at :timestamptz      not null
#  updated_at :timestamptz      not null
#  store_id   :bigint           not null
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
