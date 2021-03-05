class WorkdayProduct < ApplicationRecord
  belongs_to :workday
  belongs_to :product

  validates :product_id, uniqueness: { scope: :workday_id }
end