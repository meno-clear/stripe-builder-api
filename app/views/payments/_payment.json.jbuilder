json.extract! payment, :id, :customer_id, :payment_intent_id, :status, :created_at, :updated_at
json.url payment_url(payment, format: :json)
