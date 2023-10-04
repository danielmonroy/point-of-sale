class Expense < ApplicationRecord
  enum source: [ :card, :cash ]

  scope :for_date, -> (date_start, date_end) { where('date >= ? and date <= ?', date_start, date_end) }
end
