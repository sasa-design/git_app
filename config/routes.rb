Rails.application.routes.draw do
  root to: 'home#index'

  namespace :api do
    resources :rooms, only: [:index, :create,:show, :update, :destroy] 
    resources :users, only: [:show, :create] do
      collection do
        get :followers  ,:matchers
      end
    end
    resources :mypage, only: [:index,:show,:update]
    resources :sessions, only: [:create]
    resources :search, only: [:index]
    resources :relationship, only: [:index, :show, :create]
    resources :messages, only: [:show,:create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end