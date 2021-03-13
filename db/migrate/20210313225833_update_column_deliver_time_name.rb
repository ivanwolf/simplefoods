class UpdateColumnDeliverTimeName < ActiveRecord::Migration[7.0]
  def change
    rename_column :workday_products, :deliver_time, :delivery_time
  end
end
