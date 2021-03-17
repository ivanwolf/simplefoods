class UpdateStoreTable < ActiveRecord::Migration[7.0]
  def change
    create_table :phone_numbers do |t|
      t.integer :country_code
      t.integer :number
      t.timestamps
    end

    phone_number = PhoneNumber.create(country_code: 56, number: 911111111 )

    add_reference :stores, :phone_number, foreign_key: true
    add_column :stores, :email, :string

    Store.update_all(phone_number_id: phone_number.id, email: "test@sfood.cl")

    change_column_null :stores, :phone_number_id, false
    change_column_null :stores, :email, false
  end
end
