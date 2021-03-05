class MakeProductOrderCustumerWorkDay < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses, comment: "List of customers addresses" do |t|
      t.text :street, null: false
      t.text :number, null: false
      t.text :department, null: false, comment: "Dept, office or extra info"
      t.timestamps null: false
    end

    create_table :customers, comment: "List of clients" do |t|
      t.text :name, null: false
      t.text :last_name, null: false
      t.text :phone_number, null: false
      t.integer :apartment, null: false
      t.timestamps null: false
    end

    create_table :workdays, comment: "List of workdays" do |t|
      t.date :work_date, null: false
      t.timestamps null: false
    end

    create_table :products, comment: "list of products" do |t|
      t.text :name, null: false
      t.integer :price, null: false
      t.timestamps null: false
    end

    create_table :orders, comment: "List of orders" do |t|
      t.boolean :paid, default: false
      t.references :customer, null: false, foreign_key: true
      t.references :workday, null: false, foreign_key: true
      t.text :delivery_comment
      t.timestamps null: false
    end

    create_table :order_products, comment: "List products of an order" do |t|
      t.references :product, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.integer :quantity, null: false
      t.timestamps null: false
    end
    
    create_table :workday_products, comment: "List of products availables for a workday" do |t|
      t.references :product, null: false, foreign_key: true
      t.references :workday, null: false, foreign_key: true
      t.integer :stock, null: false
      t.timestamps null: false
    end

    add_index :order_products, [:order_id, :product_id], unique: true, comment: "No order can have two of the same product"
    add_index :workday_products, [:workday_id, :product_id], unique: true, comment: "No order can have two of the same product"
    add_index :products, :name, unique: true, comment: "No two products should have the same name"


    add_check_constraint(
      :products,
      "price > 0",
      name: "price_must_be_positive"
    )

    add_check_constraint(
      :order_products,
      "quantity > 0",
      name: "queantity_must_be_positive"
    )

    add_check_constraint(
      :workday_products,
      "stock >= 0",
      name: "stock_cant_be_negative"
    )
  end
end
