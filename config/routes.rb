Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :vinyls do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: :destroy
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # resources :vinyls do
  #   resoucres :bookings
  # end
  # get '/dashboard', to: 'dashboard#index', as: 'dashboard'
end


# #       Prefix  Verb    URI Pattern            Controller#Action
#     restaurants  GET     /restaurants           restaurants#index
#                  POST    /restaurants           restaurants#create
#  new_restaurant  GET     /restaurants/new       restaurants#new
# edit_restaurant  GET     /restaurants/:id/edit  restaurants#edit
#      restaurant  GET     /restaurants/:id       restaurants#show
#                  PATCH   /restaurants/:id       restaurants#update
#                  DELETE  /restaurants/:id       restaurants#destroy
