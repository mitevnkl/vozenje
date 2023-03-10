Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post "posts", to: "pages#create"
  get "posts", to: "pages#index"
  delete "posts/:id", to: "pages#destroy", as: :destroy
  get "privacy", to: "pages#privacy"
  get "terms", to: "pages#terms"
  get "data_deletion", to: "pages#data_deletion"
  # Defines the root path route ("/")
  # root "articles#index"
end
