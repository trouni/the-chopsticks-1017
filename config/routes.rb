Rails.application.routes.draw do
  # verb '/path', to: 'controller#action', as: :prefix
  # the prefix ONLY refers to the path, not the http verb
  # get '/restaurants/top', to: 'restaurants#top', as: :top_restaurants

  resources :restaurants do
    resources :reviews, only: [:new, :create]
  end
  resources :reviews, only: [:destroy]
end

# collection -> when it's about all restaurants (aka no id)
# member -> when it's about one specific restaurant (aka need an id)
# collection do
#   get :top
# end
# member do
#   get :chef
# end

# restaurant = Restaurant.find(this needs to come from the params)
# review.restaurant = restaurant
# we need the restaurant's id in our new/create routes
