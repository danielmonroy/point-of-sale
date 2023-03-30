json.extract! product, :id, :name, :category_id, :store_id, :available, :product_code, :created_at, :updated_at
json.url product_url(product, format: :json)
