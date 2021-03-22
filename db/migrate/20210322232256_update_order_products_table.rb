class UpdateOrderProductsTable < ActiveRecord::Migration[7.0]
  def change
    change_column_null :order_products, :workday_product_id, false
    remove_reference :order_products, :product, foreign_key: true
  end
end
