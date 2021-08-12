class AddPublishedToProduct < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :published, :boolean, default: true

    add_column :products, :discarded_at, :datetime
    add_index :products, :discarded_at

    change_column_null :orders, :workday_id, true
    change_column_null :order_products, :workday_product_id, true

    add_column :orders, :paid_at, :datetime
    add_column :orders, :amount_to_pay, :integer

    add_column :order_products, :unit_price, :integer
    add_reference :order_products, :product, foreign_key: true

    create_table :stocks, comment: "Product sotck history" do |t|
      t.references :product, null: false, foreign_key: true
      t.references :store, null: false, foreign_key: true
      t.integer :quantity, null: false
      t.integer :unit_price, null: false

      t.timestamps
    end
  end
end
