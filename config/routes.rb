Rails.application.routes.draw do
  root 'welcome#index'
  resources :users, only: [:show, :new, :create] do
    scope module: :user do
      resources :dashboard, only: [:index]
    end
  end

  post '/login', to: 'sessions#create'
end
