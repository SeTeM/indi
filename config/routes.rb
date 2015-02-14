Rails.application.routes.draw do
  root to: 'index#index'

  resource :index, only: [:index]

  namespace :api do
    resources :users, only: [:index, :create]
    resources :sessions, only: [:create] do
      delete :destroy, on: :collection
    end
  end
end
