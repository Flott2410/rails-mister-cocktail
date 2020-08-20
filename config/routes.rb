Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "cocktails/new", to: 'cocktails#new'
  post "cocktails", to: 'cocktails#create'

  get "cocktails", to: 'cocktails#index'
  get "cocktails/:id", to: 'cocktails#show', as: :cocktail

  get "cocktails/42/doses/new", to: 'doses#new'
  post "cocktails/42/doses", to: 'doses#create'

  delete "doses/25", to: 'doses#destroy'


end


#     A user can see the list of cocktails

# GET "cocktails"

#     A user can see the details of a given cocktail, with the dose needed for each ingredient

# GET "cocktails/42"

#     A user can create a new cocktail

# GET "cocktails/new"
# POST "cocktails"
