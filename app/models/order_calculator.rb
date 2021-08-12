# Class to compute data based on Order's data

## TODO: create prducts_table model
class OrderCalculator
  def self.total_units_taken(product_id)
    OrderProduct.where({product_id: product_id}).sum(:quantity)
  end
end