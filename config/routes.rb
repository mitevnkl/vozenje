Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post "posts", to: "pages#create"
  get "posts", to: "pages#index"
  delete "posts/:id", to: "pages#destroy", as: :destroy
  # Defines the root path route ("/")
  # root "articles#index"
end
