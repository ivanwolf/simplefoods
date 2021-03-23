# Class to compute data based on Order's data

class OrderCalculator
  def self.total_units_taken(product_id)
    OrderProduct.joins(:workday_product).where(workday_products: {product_id: product_id}).sum(:quantity)
  end
end