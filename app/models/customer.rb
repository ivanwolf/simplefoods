# == Schema Information
#
# Table name: customers
#
#  id           :bigint           not null, primary key
#  name         :text             not null
#  last_name    :text             not null
#  phone_number :text             not null
#  apartment    :integer          not null
#  created_at   :timestamptz      not null
#  updated_at   :timestamptz      not null
#
class Customer < ApplicationRecord
  acts_as_tenant :store

  validates :name, :last_name, :phone_number, :apartment, :address, presence: true

  def full_name
    "#{name} #{last_name}"
  end
end
