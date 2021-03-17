class Store < ApplicationRecord
  has_one_attached :logo
  belongs_to :phone_number

  accepts_nested_attributes_for :phone_number

  validates :name, :slug, presence: true, allow_blank: false

end