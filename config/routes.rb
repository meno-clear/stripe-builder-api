Rails.application.routes.draw do
  resources :payments
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
  resources :payments
  put '/payments/:id/confirm', to: 'payments#confirm', defaults: {format: :json}
  get '/plans', to: 'stripe#plans', defaults: {format: :json}
  get '/plans/:id', to: 'stripe#plan', defaults: {format: :json}
  get '/subscriptions', to: 'stripe#new_subscription', defaults: {format: :json}
  default_url_options :host => "localhost:3000"

  root to: 'main#index'
end
