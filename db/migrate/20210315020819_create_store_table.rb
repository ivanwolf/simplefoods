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
  end
end
