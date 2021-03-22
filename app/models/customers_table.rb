class CustomersTable
  attr_accessor :rows, :order_counts

  def initialize(page)
    @scope = Customer.left_outer_joins(:orders)
                     .group("customers.id")
                     .order("count_orders_id DESC")
                     .page(page)

    @order_counts = @scope.count("orders.id")

    @rows = Customer.find(@order_counts.keys).map do |customer|
      [customer, @order_counts[customer.id]]
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