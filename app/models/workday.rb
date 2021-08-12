# == Schema Information
#
# Table name: workdays
#
#  id         :bigint           not null, primary key
#  work_date  :date             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  store_id   :bigint           not null
#
class Workday < ApplicationRecord
  acts_as_tenant :store

  has_many :workday_products
  has_many :orders

  def title(mobile = false)
    I18n.l(work_date, format: mobile ? "%a %d, %B" : "%A %d de %B")
  end

  def to_slug
    work_date.strftime("%d-%b").downcase
  end

  def self.by_slug(store_slug, date_string)
    date = Date.strptime(date_string, "%d-%b")

    Workday.joins(:store).where(stores: { slug: store_slug}).where(work_date: date)
  end
end
