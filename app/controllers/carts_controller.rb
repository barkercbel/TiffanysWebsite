class CartsController < ApplicationController
  layout "no_sidebar"

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
