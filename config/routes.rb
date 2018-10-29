Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: %i[show] do
    resources :spaces, only: %i[create]
  end

  resources :spaces, except: %i[new destroy] do
    resources :rentals, only: %i[create]
  end
  resources :spaces, only: %i[filter]
end
