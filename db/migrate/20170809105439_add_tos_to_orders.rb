class AddTosToOrders < ActiveRecord::Migration
  def change
    add_column :spree_orders, :terms_and_conditions, :boolean, default: false
  end
end