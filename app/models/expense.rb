class Expense < ApplicationRecord
  enum source: [ :card, :cash ]
end
