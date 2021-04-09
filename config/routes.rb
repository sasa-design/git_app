Rails.application.routes.draw do
  root to: 'home#index'
  get '/rooms/create'=>'home#index'
  get '/edit/:id'=>'home#index'

  namespace :api do
    resources :rooms, only: [:index, :create,:show, :update, :destroy] do
      get 'search',on: :collection
    end
    resources :users, only: [:create]
    resources :mypage, only: [:index, :show,:update]
    resources :sessions, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end