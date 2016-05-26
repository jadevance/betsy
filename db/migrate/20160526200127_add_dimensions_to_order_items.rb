class AddDimensionsToOrderItems < ActiveRecord::Migration
  def change
    add_column :order_items, :height, :integer
    add_column :order_items, :length, :integer
    add_column :order_items, :width, :integer
    add_column :order_items, :weight, :integer
  end
end
