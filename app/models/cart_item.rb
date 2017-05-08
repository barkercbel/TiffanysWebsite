class CartItem < ApplicationRecord
  belongs_to :gallery
  belongs_to :cart
end
