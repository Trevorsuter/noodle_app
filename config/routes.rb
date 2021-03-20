Rails.application.routes.draw do
  root 'welcome#index'
  resources :users, only: [:show, :new, :create] do
    scope module: :user do
      resources :dashboard, only: [:index]
      resources :lists
      resources :partner_requests, only: [:create, :destroy]
      resources :partner, only: [:update]
      resources :competitions, only: [:index, :show] do
        resources :games, only: [:show]
      end
    end
  end
  resources :lists, only: [:show] do
    scope module: :list do
      resources :tasks
    end
  end
  resources :competitions, only: [:new, :create, :show] do
    scope module: :competition do
      resources :games, only: [:new, :create, :destroy]
    end
  end
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
