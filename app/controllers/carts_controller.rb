class CartsController < ApplicationController
  layout "no_sidebar", except: :add_item_to_cart
  layout false, only: [:add_item_to_cart]

  #POST /carts/addItem
  def add_item_to_cart()
    gallery_item = @cart.add_item(params[:id])
    if gallery_item
      gallery_item.save
    end
  end
  
  def remove_items_from_cart
    gallery_item = @cart.remove_item(params[:id], params[:quantity])
    puts gallery_item.quantity
    if gallery_item
      if gallery_item.quantity < 1
        gallery_item.destroy
      else
        gallery_item.save
      end
    end
  end
  
  def clear_cart
    @cart.destroy
  end
  
  
  def show
    
  end
  
end