class CartsController < ApplicationController
  layout "no_sidebar", except: :add_item_to_cart
  layout false, only: [:add_item_to_cart]

  #POST /carts/addItem
  def add_item_to_cart()
    gallery_item = @cart.add_item(params[:id])
    gallery_item.save
    
  end


  def clear_cart
    @cart.destroy
  end
  
  
  def show
    
  end
  
end