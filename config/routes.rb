Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'artists#index'

  resources :artists do
    resources :songs, only: [:new, :create, :show, :destroy]
  end

end
