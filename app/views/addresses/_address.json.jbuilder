json.extract! address, :id, :address, :street, :number, :district, :city, :state, :country, :postal_code, :longitude, :latitude, :coordinates, :created_at, :updated_at
json.url address_url(address, format: :json)
