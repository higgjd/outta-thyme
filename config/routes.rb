Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :users
  root to: 'pages#home'

  resources :recipes, only: [:show, :index] do
    resources :favourites, only: [:index, :destroy, :new, :create ]
  end

  get 'recipes/index'
  get 'recipes/show'
  post 'search', to: 'recipes#search', as: :search

  # get 'favourites/index'
  # get 'favourites/new'
  # get 'favourites/create'
  # get 'favourites/destroy'

  # get '/search', to: 'recipes#search'
  # get 'recipes', to: 'recipes#search_results'
end
