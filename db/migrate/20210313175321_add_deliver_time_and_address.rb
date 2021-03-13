class AddDeliverTimeAndAddress < ActiveRecord::Migration[7.0]
  def change
    add_column :workday_products, :deliver_time, :string
    add_column :customers, :address, :string, null: false
  end

end
