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
#
class OrderProduct < ApplicationRecord
  acts_as_tenant :store

  belongs_to :order
  belongs_to :product

  validates :quantity, presence: true
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }

  delegate :name, :cover_photo, to: :product

  def price
    product.price * quantity
  end

  def delivery_time
    WorkdayProduct.find_by(product_id: product_id, workday_id: order.workday_id ).delivery_time
  end
end
