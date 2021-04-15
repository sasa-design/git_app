Rails.application.routes.draw do
  root to: 'home#index'
  get '/rooms/create'=>'home#index'
  get '/edit/:id'=>'home#index'

  namespace :api do
    resources :rooms, only: [:index, :create,:show, :update, :destroy] 
    resources :users, only: [:show, :create]
    resources :mypage, only: [:index, :show,:update]
    resources :sessions, only: [:create, :destroy]
    resources :search, only: [:index]
    resources :relationship, only: [:index, :show, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end