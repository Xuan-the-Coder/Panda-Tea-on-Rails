Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
  end
  devise_scope :user do
    get 'sign_up', to: 'devise/registrations#new'
  end
  devise_for :users, skip: :all
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

  get 'search', to: 'products#search', as: 'search'

  get ":permalink", to: "pages#permalink", as: "permalink"

  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'success', to: 'checkout#success', as: 'checkout_success'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
