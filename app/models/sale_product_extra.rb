class SaleProductExtra < ApplicationRecord
  belongs_to :sale_product
  belongs_to :item
end
