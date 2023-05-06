Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  get 'home/about' => "homes#about", as: "about"
  resources :books, only: [:new, :create, :edit, :index, :show, :destroy, :update] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :update, :index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
