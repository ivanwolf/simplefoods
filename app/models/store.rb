# == Schema Information
#
# Table name: stores
#
#  id              :bigint           not null, primary key
#  name            :string           not null
#  slug            :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  phone_number_id :bigint           not null
#  email           :string           not null
#
class Store < ApplicationRecord
  has_one_attached :logo
  belongs_to :phone_number

  accepts_nested_attributes_for :phone_number

  validates :name, presence: true, allow_blank: false
end
