Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
<<<<<<< Updated upstream
  resources :items, only: :index
=======
  resources :user, only: [:new] do
    resources :items, only: [:index, :new]
  end
>>>>>>> Stashed changes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
