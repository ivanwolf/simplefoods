class Store < ApplicationRecord
  has_one_attached :logo

  validates :name, :slug, presence: true, allow_blank: false

  belongs_to :phone_number
end