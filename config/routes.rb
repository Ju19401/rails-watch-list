Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'lists#id'
  resources :lists do
    resources :bookmarks, only: [:new, :create]
    get '/lists/:list_id/bookmarks/new', to: 'bookmarks#new'
  end
  resources :bookmarks, only: [:destroy]
end
