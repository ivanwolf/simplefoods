# == Schema Information
#
# Table name: workday_products
#
#  id         :bigint           not null, primary key
#  product_id :bigint           not null
#  workday_id :bigint           not null
#  stock      :integer          not null
#  created_at :timestamptz      not null
#  updated_at :timestamptz      not null
#
class WorkdayProduct < ApplicationRecord
  belongs_to :workday
  belongs_to :product

  validates :product_id, uniqueness: { scope: :workday_id }

  delegate :name, :price, :cover_photo, to: :product
end
