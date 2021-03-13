Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users,
              path: 'api/users',
              controllers: {
                registrations: 'api/users/registrations',
                sessions: 'api/users/sessions'
              }

  get '/health', to: 'health#health'
  namespace :api do
    resources :posts, only: [:index, :show] do
      collection do
        get :search, controller: 'posts', action: 'search'
      end
    end
    resources :users, only: [] do
      collection do
        resources :posts, only: [:index, :create, :update], controller: 'users/posts'
      end
    end
  end
end
