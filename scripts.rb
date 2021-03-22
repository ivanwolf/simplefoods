duplicated_phones = Customer.group(:phone_number).having("count(id) > 1").count.keys

duplicated_phones.each do |phone_number|
  customer = Customer.find_by_phone_number(phone_number)
  Order.joins(:customer).where(customers: { phone_number: phone_number}).update_all(customer_id: customer.id)
end