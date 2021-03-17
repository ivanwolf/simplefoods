class Store < ApplicationRecord
  has_one_attached :logo

  validates :name, :slug, presence: true, allow_blank: false
end