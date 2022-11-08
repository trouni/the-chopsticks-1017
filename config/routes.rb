Rails.application.routes.draw do
  # verb '/path', to: 'controller#action', as: :prefix
  # the prefix ONLY refers to the path, not the http verb

  # CRUD
  # Read all
  get '/restaurants', to: 'restaurants#index', as: :restaurants

  # Create
  # we need a page for a form
  get '/restaurants/new', to: 'restaurants#new', as: :new_restaurant
  post '/restaurants', to: 'restaurants#create'

  # Read one
  get '/restaurants/:id', to: 'restaurants#show', as: :restaurant

  # Update
  # we need a page for a form
  get '/restaurants/:id/edit', to: 'restaurants#edit', as: :edit_restaurant
  patch '/restaurants/:id', to: 'restaurants#update'

  # Destroy
  delete '/restaurants/:id', to: 'restaurants#destroy'
end
