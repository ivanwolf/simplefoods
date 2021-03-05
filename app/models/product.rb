# == Schema Information
#
# Table name: products
#
#  id         :bigint           not null, primary key
#  name       :text             not null
#  price      :integer          not null
#  created_at :timestamptz      not null
#  updated_at :timestamptz      not null
#
class Product < ApplicationRecord
  has_one_attached :cover_photo

  validates :name, presence: true, allow_blank: false
  validates :price, numericality: { greater_than: 0 }

  has_many :workday_products, dependent: :destroy
  has_many :order_products, dependent: :destroy
end
