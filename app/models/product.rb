# == Schema Information
#
# Table name: products
#
#  id           :bigint           not null, primary key
#  name         :string           not null
#  price        :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  store_id     :bigint           not null
#  published    :boolean
#  discarded_at :datetime
#
class Product < ApplicationRecord
  acts_as_tenant :store
  include Discard::Model

  has_one_attached :cover_photo

  validates :name, presence: true, allow_blank: false
  validates :price, numericality: { greater_than: 0 }

  has_many :workday_products, dependent: :restrict_with_error
  has_many :order_products,  dependent: :restrict_with_error

  def self.published
    where(published: true)
  end
end
