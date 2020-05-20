Rails.application.routes.draw do
  get 'welcome/index'
  resources :songs do
    post 'restore', on: :member
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'
end
