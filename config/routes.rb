Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users do
    resources :bands, only: [ :show, :new, :create, :edit, :update, :destroy ] do
      resources :songs, only: [ :show, :new, :create, :edit, :update, :destroy ] do
        resources :partitions, only: [ :show, :new, :create, :edit, :update, :destroy ] do
          resources :comments, only: [ :new, :create ]
        end
      end
    end
    resources :members
  end
end
