# == Schema Information
#
# Table name: orders
#
#  id          :bigint           not null, primary key
#  paid        :boolean          default(FALSE)
#  customer_id :bigint           not null
#  workday_id  :bigint           not null
#  created_at  :timestamptz      not null
#  updated_at  :timestamptz      not null
#
class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :workday

  has_many :order_products, dependent: :destroy

  accepts_nested_attributes_for :order_products
  accepts_nested_attributes_for :customer
end
