class AddColumsToCartItems < ActiveRecord::Migration[5.2]
  def change
    add_column :cart_items, :product_id, :integer
    add_column :cart_items, :member_id, :integer
    add_column :cart_items, :number, :integer
  end
end
