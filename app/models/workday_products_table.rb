class WorkdayProductsTable
  attr_accessor :rows

  def initialize(workday_id)
    workday_products = WorkdayProduct.where(workday_id: workday_id).left_outer_joins(:order_products)
                           .group("workday_products.id")
                           .order("sum_order_products_quantity DESC")
                           .sum("order_products.quantity")

    @rows = WorkdayProduct.find(workday_products.keys).map do |workday_product|
      [workday_product, workday_products[workday_product.id]]
    end.sort_by(&:last).reverse
  end 
end