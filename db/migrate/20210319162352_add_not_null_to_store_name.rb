class AddNotNullToStoreName < ActiveRecord::Migration[7.0]
  def change
    change_column_null :stores, :name, false
    change_column_null :stores, :slug, false
  end
end
