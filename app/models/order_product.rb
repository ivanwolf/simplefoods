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
  belongs_to :product

  validates :quantity, presence: true
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }

  # TODO: add this restriction to DB
  validates :unit_price, presence: true
  validates :unit_price, numericality: { greater_than_or_equal_to: 0 }

  delegate :name, :cover_photo, to: :product

  after_initialize :set_unit_price, unless: :persisted?

  def price
    unit_price * quantity
  end

  private

  def set_unit_price
    self.unit_price = product.price
  end
end


OrderProduct.all.each do |op|
  product = Product.joins(:workday_products).where(workday_products: { id: op.workday_product_id}).take
  op.update(product: product, unit_price: product.price) if product.present?
end