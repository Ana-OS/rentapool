Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :pools do
  # adding show
    resources :bookings, only: [:new, :show, :create,:update, :edit, :index]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
  resources :bookings, only: [:destroy]

  resources :user, only: [] do
    collection do
      get :profile
      get :bookings
      get :pools
    end
  end
end
