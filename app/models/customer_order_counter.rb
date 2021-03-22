class CustomerOrderCounter
  attr_accessor :data

  def initialize(customers)
    @data = Order.joins(:customer).where(customer: customers).group(:customer_id).count(:customer_id)
  end

  def get(customer_id)
    @data[customer_id] || 0
  end
end