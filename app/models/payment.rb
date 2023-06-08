class Payment < ApplicationRecord
  belongs_to :order
  
  enum discount_type: [ :percentage, :direct ]
  enum payment_method: [ :card, :cash, :transfer ]

  scope :for_date, -> (date_start, date_end) { where('created_at > ? and created_at < ?', date_start, date_end) }
end

