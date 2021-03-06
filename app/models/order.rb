# == Schema Information
#
# Table name: orders
#
#  id               :bigint           not null, primary key
#  paid             :boolean          default(FALSE)
#  customer_id      :bigint           not null
#  workday_id       :bigint           not null
#  delivery_comment :string
#  created_at       :timestamptz      not null
#  updated_at       :timestamptz      not null
#  store_id         :bigint           not null
#
class Order < ApplicationRecord
  acts_as_tenant :store

  belongs_to :customer
  belongs_to :workday

  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products

  accepts_nested_attributes_for :order_products
  accepts_nested_attributes_for :customer

  def total_price
    order_products.map(&:price).reduce(:+)
  end
end
