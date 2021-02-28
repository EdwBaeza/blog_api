Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/health', to: 'health#health'
  namespace :api do
    resources :posts, only: [:index, :show, :create, :destroy] do
      collection do
        get :search, controller: 'posts', action: 'search'
      end
    end
    resources :users, only: [] do
      resources :posts, only: [:index], controller: 'users/posts'
    end
  end
end
