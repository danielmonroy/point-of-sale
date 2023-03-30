json.extract! item, :id, :name, :stock, :measurement_unit, :stock_warning, :store_id, :created_at, :updated_at
json.url item_url(item, format: :json)
