Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "events#index"

  resources :events do
    resources :registrations
    resources :likes
  end

  resource :session, only: [:new, :create, :destroy]

  resources :users
  get "signup", to: "users#new"
  get "signin" => "sessions#new"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

end
