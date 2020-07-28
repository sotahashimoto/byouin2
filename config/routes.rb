Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'hospitals#index'
  resources :hospitals do
    resources :comments, only: [:create, :destroy]
    resource :favorites
  end
  resources :users, only: [:index, :show]
end
