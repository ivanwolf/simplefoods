class WorkdayProductsTable
  attr_accessor :rows

  def initialize(workday_id)
    workday_products = WorkdayProduct.where(workday_id: workday_id)
                                     .left_outer_joins(:order_products)
                                     .group("workday_products.id")
                                     .order("sum_order_products_quantity DESC")
                                     .sum("order_products.quantity")

    revenues = WorkdayProduct.where(id: workday_products.keys)
                             .joins(:product)
                             .left_outer_joins(:order_products)
                             .group("workday_products.id")
                             .sum("order_products.quantity * products.price")

    @rows = WorkdayProduct.find(workday_products.keys).map do |workday_product|
      [workday_product, workday_products[workday_product.id], revenues[workday_product.id]]
    end.sort_by(&:last).reverse
  end 
end