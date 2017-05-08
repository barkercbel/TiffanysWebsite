class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  
  
  def add_item(id)
    current_item = cart_items.find_by(gallery_id: id)
    if current_item
      current_item.quantity += 1
     else
       current_item = CartItem.new
       current_item.cart = self
       current_item.gallery = Gallery.find(id)
    end
    current_item
  end

  def total
    total_price = 0
    
    cart_items.each do |item|
      total_price += (item.gallery.price * item.quantity)
    end
    total_price
  end
  
end
