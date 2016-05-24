class AddingAddressFieldsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :city, :string
    add_column :orders, :state, :string
    add_column :orders, :zip, :string
  end
end
