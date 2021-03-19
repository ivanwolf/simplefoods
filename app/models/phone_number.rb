# == Schema Information
#
# Table name: phone_numbers
#
#  id           :bigint           not null, primary key
#  country_code :integer
#  number       :integer
#  created_at   :timestamptz      not null
#  updated_at   :timestamptz      not null
#
class PhoneNumber < ApplicationRecord
end
