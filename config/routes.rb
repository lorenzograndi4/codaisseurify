Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'artists#index'

  resources :artists, only: [:index, :show, :destroy] do
    resources :songs, only: [:new, :create, :destroy]
  end

  namespace :api do
    resources :artists, only: [:show] do
      resources :songs, only: [:index, :new, :create, :destroy]
    end
  end

  match '*path', to: redirect('/'), via: :get

end
