Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'artists#index'

  resources :artists, only: [:index, :show, :destroy] do
    resources :songs, only: [:new, :create, :destroy]
  end

  namespace :api do
    resources :artists, only: [:show, :destroy] do
      resources :songs, only: [:index, :new, :create]
    end
  end

  # It is ridicolous that I have to do it like this!
  # The problem comes with the Ajax DELETE call for the single song
  # The path seems to start at localhost:3000/artists
  # Not ideal, it is what it is ¯\_(ツ)_/¯

  resources :artists, only: :show do
    namespace :api do
      resources :songs, only: :destroy
    end
  end

  match '*path', to: redirect('/'), via: :get

end
