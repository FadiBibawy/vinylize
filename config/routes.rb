Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :vinyls do
    resources :bookings, only: [:index, :new, :create]
  end

  resources :bookings, only: :destroy
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
