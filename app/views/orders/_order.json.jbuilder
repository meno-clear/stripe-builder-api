json.extract! order, :id, :total, :price_in_cents, :payment_id, :market_place_partner_name, :market_place_partner_id, :user_id, :cart_id, :created_at, :updated_at
json.status order.payment.present? ? order.payment.status : 'pending'
json.url order_url(order, format: :json)
