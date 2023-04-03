json.extract! order, :id, :total, :price_in_cents, :market_place_partner_name, :market_place_partner_id, :status, :user_id, :cart_id, :created_at, :updated_at
json.url order_url(order, format: :json)
