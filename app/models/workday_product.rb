# == Schema Information
#
# Table name: workday_products
#
#  id            :bigint           not null, primary key
#  product_id    :bigint           not null
#  workday_id    :bigint           not null
#  stock         :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  delivery_time :time
#  store_id      :bigint           not null
#
class WorkdayProduct < ApplicationRecord
  acts_as_tenant :store

  belongs_to :workday
  belongs_to :product

  has_many :order_products

  validates :product_id, uniqueness: { scope: :workday_id }

  delegate :name, :price, :cover_photo, to: :product
end
