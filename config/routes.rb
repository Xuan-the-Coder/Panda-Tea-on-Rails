Rails.application.routes.draw do
  resources :pages
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'categories/index'
  get 'categories/show'
  get 'products/index'
  get 'products/show'
  root to: 'products#index'
  resources "products", only: %i[index show]
  resources "categories", only: %i[index show]

  get ":permalink", to: "pages#permalink", as: "permalink"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
