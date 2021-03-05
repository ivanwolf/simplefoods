# == Schema Information
#
# Table name: customers
#
#  id         :bigint           not null, primary key
#  name       :text             not null
#  last_name  :text             not null
#  address    :text             not null
#  address_id :bigint           not null
#  created_at :timestamptz      not null
#  updated_at :timestamptz      not null
#
class Customer < ApplicationRecord
end
