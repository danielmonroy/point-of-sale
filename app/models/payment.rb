class Payment < ApplicationRecord
  belongs_to :order
  
  enum discount_type: [ :percentage, :direct ]
  enum payment_method: [ :card, :cash, :transfer ]
end

