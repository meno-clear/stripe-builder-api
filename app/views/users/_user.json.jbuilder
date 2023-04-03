json.(
  user, 
  :id, 
  :email, 
  :first_name, 
  :last_name
)
json.avatar user.avatar.attached? ? Rails.application.routes.url_helpers.rails_blob_path(user.avatar) : nil
json.market_place_partner user.market_place_partner.present? ? user.market_place_partner : nil  
json.token user.generate_jwt