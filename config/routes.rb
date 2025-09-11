Rails.application.routes.draw do
  # Main entities with only index/show
  resources :rooms, only: [:index, :show]
  resources :guests, only: [:index, :show]
  resources :reservations, only: [:index, :show]
  resources :services, only: [:index, :show]

  # Health check (Rails 7+ default)
  get "up" => "rails/health#show", as: :rails_health_check

  # Root path → redirect to Rooms#index
  root "rooms#index"
end
