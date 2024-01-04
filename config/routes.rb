Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :articles, only: [:index]
  post 'update_search_logs', to: "articles#update_search_logs", as: :update_search_logs
  root "articles#index"
end
