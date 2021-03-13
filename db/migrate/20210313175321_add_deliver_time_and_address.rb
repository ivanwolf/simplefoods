class AddDeliverTimeAndAddress < ActiveRecord::Migration[7.0]
  def change
    add_column :workday_products, :deliver_time, :time
    add_column :customers, :address, :string

    Customer.update_all(address: "Cerro Paranal 360")
    change_column_null :customers, :address, false
  end

end
