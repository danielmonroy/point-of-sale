class CartProductExtra < ApplicationRecord
  belongs_to :cart_product
  belongs_to :item
end
