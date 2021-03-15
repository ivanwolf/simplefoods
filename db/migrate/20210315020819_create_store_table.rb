class CreateStoreTable < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :slug
      t.timestamps
    end
    
    create_table :banks do |t|
      t.string :name
      t.timestamps
    end

    create_table :account_types do |t|
      t.string :name
      t.timestamps
    end
    
    create_table :transfer_data do |t|
      t.references :store, null: false, foreign_key: true
      t.references :bank, null: false, foreign_key: true
      t.references :account_type, null: false, foreign_key: true
      t.string :rut, null: false
      t.string :name, null: false
      t.string :email, null: false
      t.string :account_number, null: false
      t.timestamps
    end

    store = Store.find_or_create_by(name: "Mano Morena", slug: "manomorena")

    add_reference :products, :store, foreign_key: true
    add_reference :customers, :store, foreign_key: true
    add_reference :workdays, :store, foreign_key: true
    add_reference :workday_products, :store, foreign_key: true
    add_reference :orders, :store, foreign_key: true
    add_reference :order_products, :store, foreign_key: true

    Product.update_all(store_id: store.id)
    Customer.update_all(store_id: store.id)
    Workday.update_all(store_id: store.id)
    WorkdayProduct.update_all(store_id: store.id)
    Order.update_all(store_id: store.id)
    OrderProduct.update_all(store_id: store.id)

    change_column_null :products, :store_id, false
    change_column_null :customers, :store_id, false
    change_column_null :workdays, :store_id, false
    change_column_null :workday_products, :store_id, false
    change_column_null :orders, :store_id, false
    change_column_null :order_products, :store_id, false
  end
end
