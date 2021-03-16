# Class to compute data based on Order's data

class OrderCalculator

  def self.units_taken(workday_id, product_id)
    OrderProduct.joins(:order)
                .where(product_id: product_id)
                .where(orders: { workday_id: workday_id})
                .sum(:quantity)
  end

  def self.revenue_at(workday_id, product_id = nil)
    scope = OrderProduct.joins(:order, :product).where(orders: { workday_id: workday_id})
                
    scope = scope.where(product_id: product_id) if product_id.present?

    scope.sum("order_products.quantity * products.price")
  end

  def self.total_units_taken(product_id)
    OrderProduct.where(product_id: product_id).sum(:quantity)
  end
end