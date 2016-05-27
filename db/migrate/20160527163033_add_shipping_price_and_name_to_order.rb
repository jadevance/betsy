class AddShippingPriceAndNameToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :shipping_price, :string
    add_column :orders, :shipping_name, :string
  end
end
