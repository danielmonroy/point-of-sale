class ExternalIncome < ApplicationRecord
  enum payment_method: [ :card, :cash ]
  enum source: [ :uber_eats, :didi_food, :rappi, :other ]

  scope :for_date, -> (date_start, date_end) { where('date >= ? and date <= ?', date_start, date_end) }
end
