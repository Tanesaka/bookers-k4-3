Rails.application.routes.draw do
  root 'homes#top'
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update]
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]
  get "relationships/follows/:id" => "relationships#follows", as: :relationships_follows
  get "relationships/followers/:id" => "relationships#followers", as: :relationships_followers
  get "home/about" => "homes#about"
end