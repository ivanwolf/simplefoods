# == Schema Information
#
# Table name: stores
#
#  id              :bigint           not null, primary key
#  name            :string
#  slug            :string
#  created_at      :timestamptz      not null
#  updated_at      :timestamptz      not null
#  phone_number_id :bigint           not null
#  email           :string           not null
#
class Store < ApplicationRecord
  has_one_attached :logo
  belongs_to :phone_number

  accepts_nested_attributes_for :phone_number

  validates :name, :slug, presence: true, allow_blank: false

end
