class AddQuantityToCartItems < ActiveRecord::Migration[5.0]

  def up
    add_column :cart_items, :quantity, :integer, default: 1
    CartItem.reset_column_information
    CartItem.update_all(quantity: 1)
  end
  
  def down
    remove_column :cart_items, :quantity, :integer
  end

end
