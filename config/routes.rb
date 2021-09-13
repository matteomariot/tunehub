Rails.application.routes.draw do
  get 'search/index'
  devise_for :users
  root to: 'pages#home'
  resources :bands do
    resources :songs, only: [ :show, :new, :create, :edit, :update, :destroy ]
  end

  resources :songs, only: [] do
    resources :partitions, only: [ :show, :new, :create, :edit, :update, :destroy ]
  end

  resources :partitions, only: [] do
    resources :comments, only: [ :new, :create ]
  end

  resources :bands, only: [] do
    resources :members
  end

  resources :comments, only: [] do
    resources :responses, only: [ :new, :create ]
  end
end
