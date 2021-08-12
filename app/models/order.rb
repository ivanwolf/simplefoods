# == Schema Information
#
# Table name: orders
#
#  id               :bigint           not null, primary key
#  paid             :boolean          default(FALSE)
#  customer_id      :bigint           not null
#  workday_id       :bigint
#  delivery_comment :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  store_id         :bigint           not null
#  paid_at          :datetime
#  amount_to_pay    :integer
#
class Order < ApplicationRecord
  acts_as_tenant :store
  belongs_to :customer

  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products

  accepts_nested_attributes_for :order_products
  accepts_nested_attributes_for :customer

  before_save :clean_empty_order_products
  before_save :set_amount_to_pay

  after_touch :set_amount_to_pay, unless: :persisted?

  def total_price
    order_products.map(&:price).reduce(:+)
  end

  private

  def clean_empty_order_products
    return unless errors.empty?

    self.order_products = order_products.select { |op| op.quantity.positive? }
  end

  def set_amount_to_pay
    self.amount_to_pay = total_price
  end
end
