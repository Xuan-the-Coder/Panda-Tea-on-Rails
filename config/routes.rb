Rails.application.routes.draw do
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
  end
  devise_scope :user do
    get 'sign_up', to: 'devise/registrations#new'
  end
  get 'users/show'
  resources :pages
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'categories/index'
  get 'categories/show'
  get 'products/index'
  get 'products/show'
  root to: 'products#index'
  post 'products/add_to_cart/:id', to: 'products#add_to_cart', as: 'add_to_cart'
  delete 'products/remove_from_cart/:id', to: 'products#remove_from_cart', as: 'remove_from_cart'
  get 'products/edit_quantity/:id', to: 'products#edit_quantity', as: 'edit_quantity'
  resources "products", only: %i[index show]
  resources "categories", only: %i[index show]

  get ":permalink", to: "pages#permalink", as: "permalink"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
