class CustomersTableData
  attr_accessor :rows

  def initialize(page)
    @scope = Customer.page(page)
    order_counts = @scope.left_outer_joins(:orders)
                         .group(:customer_id)
                         .order("count_orders_id DESC")
                         .count("orders.id")

    @rows = Customer.find(order_counts.keys).map do |customer|
      [customer, order_counts[customer.id]]
    end
  end

  def total_pages
    @scope.total_pages
  end

  def current_page
    @scope.current_page
  end

  def limit_value
    @scope.limit_value
  end
end