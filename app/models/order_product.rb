class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product

  def price
    quantity * product.price
  end
end
