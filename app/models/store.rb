class Store < ApplicationRecord
  validates :name, :slug, presence: true, allow_blank: false
end