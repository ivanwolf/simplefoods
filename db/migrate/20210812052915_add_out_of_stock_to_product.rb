class AddOutOfStockToProduct < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :has_stock, :boolean, default: true
  end
end
