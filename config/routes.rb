Rails.application.routes.draw do
  root 'welcome#index'
  resources :users, only: [:show, :new] do
    scope module: :user do
      resources :dashboard, only: [:index]
    end
  end
end
