Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'spaces#index'
  resources :users, only: %i[show] do
    resources :spaces, only: %i[create edit update]
  end

  resources :spaces, except: %i[new destroy] do
    resources :rentals, only: %i[create]
  end

  get '/search', to: 'spaces#search', as: :search_spaces
end
