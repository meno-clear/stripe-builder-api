Rails.application.routes.draw do
  resources :market_place_partners
  resources :product_descriptor_values
  resources :product_descriptors
  resources :variant_descriptor_values
  resources :variant_descriptors
  resources :categories do
    resources :products
  end
  resources :addresses
  post 'rails/active_storage/direct_uploads', to: 'direct_uploads#create'
  devise_for :users, path: '', defaults: {format: :json}, path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'sessions',
  }

  patch '/carts/:id/cart_items', to: 'carts#update_cart_items', defaults: {format: :json}
  post '/carts/:id/checkout', to: 'carts#checkout', defaults: {format: :json}
  resource :user, only: [:show, :update]
  get '/users', to: 'users#index', defaults: {format: :json}
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  resources :variants
  resources :order_items
  resources :orders
  resources :cart_items
  resources :carts
  resources :products
  default_url_options :host => "localhost:3000"

  root to: 'main#index'
end
