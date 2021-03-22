class UpdateOrderProductColumn < ActiveRecord::Migration[7.0]
  def change
    add_reference :order_products, :workday_product, foreign_key: true
    change_column_null :order_products, :product_id, true


    # ActiveRecord::Base.transaction do
    #   OrderProduct.all.each do |order_product|
    #     order_product.workday_product = WorkdayProduct.find_by(
    #       product_id: order_product.product_id,
    #       workday_id: order_product.order.workday_id
    #     )
    #     order_product.save!
    #   end
    # end
  end
end
