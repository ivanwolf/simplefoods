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
  belongs_to :order
  belongs_to :product

  validates :quantity, presence: true

  delegate :name, :price, :cover_photo, to: :product
end
