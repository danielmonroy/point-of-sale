json.extract! expense, :id, :date, :amount, :source, :decription, :created_at, :updated_at
json.url expense_url(expense, format: :json)
