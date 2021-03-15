# == Schema Information
#
# Table name: workdays
#
#  id         :bigint           not null, primary key
#  work_date  :date             not null
#  created_at :timestamptz      not null
#  updated_at :timestamptz      not null
#
class Workday < ApplicationRecord
  acts_as_tenant :store

  has_many :workday_products
  has_many :products, through: :workday_products

  has_many :orders

  def title(mobile = false)
    I18n.l(work_date, format: mobile ? "%a %d, %B" : "%A %d de %B")
  end
end
