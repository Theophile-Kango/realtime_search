require 'sidekiq/web'
Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  mount Sidekiq::Web => '/sidekiq'

  get '/update_search', to: 'articles#update_search', as: :update_search
  get '/search_results', to: 'articles#search_results', as: :search_results

  resources :articles, only: [:index]
  post 'update_search_logs', to: "articles#update_search_logs", as: :update_search_logs
  root "articles#index"
end
