Rails.application.routes.draw do
  # get 'favourites/index'
  # get 'favourites/new'
  # get 'favourites/create'
  # get 'favourites/destroy'
  # get 'recipes/index'
  # get 'recipes/show'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :recipes, only: [:show, :index] do
    resources :favourites, only: [:index, :destroy, :new, :create ]
  end
end
