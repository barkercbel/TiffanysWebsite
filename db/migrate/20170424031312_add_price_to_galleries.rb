class AddPriceToGalleries < ActiveRecord::Migration[5.0]
  
  def up
    add_column :galleries, :price, :decimal, precision: 8, scale: 2
    Gallery.reset_column_information
    Gallery.update_all(price: 0.00)
    
    add_column :galleries, :category, :string
  end

  def down
    remove_column :galleries, :category, :string
    remove_column :galleries, :price, :decimal
  end
  
end