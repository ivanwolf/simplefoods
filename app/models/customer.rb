# == Schema Information
#
# Table name: customers
#
#  id           :bigint           not null, primary key
#  name         :string           not null
#  last_name    :string           not null
#  phone_number :string           not null
#  apartment    :integer          not null
#  created_at   :timestamptz      not null
#  updated_at   :timestamptz      not null
#  address      :string           not null
#  store_id     :bigint           not null
#
class Customer < ApplicationRecord
  acts_as_tenant :store

  validates :name, :last_name, :phone_number, :apartment, :address, presence: true

  def full_name
    "#{name} #{last_name}"
  end
end
