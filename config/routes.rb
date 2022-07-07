Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'profiles', to: 'users/registrations#new_profile'
    post 'profiles', to: 'users/registrations#create_profile'
  end
  root to: 'items#index'
  resources :items do
    collection do
      get 'search'
    end
  resources :orders, only: [:index, :create]
  end
  resources :cards, only: [:new, :create]
end
