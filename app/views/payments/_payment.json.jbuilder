json.extract! payment, :id, :order_id, :total, :discount, :discount_type, :payment_method, :created_at, :updated_at
json.url payment_url(payment, format: :json)
