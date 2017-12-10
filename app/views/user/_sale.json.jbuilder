json.extract! sale, :id, :cliente_id, :producto_id, :precio_venta, :user_id, :created_at, :updated_at
json.url sale_url(sale, format: :json)
