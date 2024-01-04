Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :articles, only: [:index]
  get 'search', to: "articles#search", as: :search
  root "articles#index"
end
