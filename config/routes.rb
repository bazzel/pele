Rails.application.routes.draw do
  get 'pins/create'
  get 'pins/destroy'
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  get 'sign_in/:token', to: 'sessions#show', as: :token_sign_in
  delete 'sign_out', to: 'sessions#destroy'

  resources :songs do
    post 'restore', on: :member
  end
  resources :pins, only: %i[create destroy]

  resources :users do
    post 'restore', on: :member
  end

  resources :groups do
    post 'restore', on: :member
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'dashboard#index'
end
