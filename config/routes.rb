Rails.application.routes.draw do
  root to: 'index#index'

  resource :index, only: [:index]

  resource :oauth, only: [] do
    get :callback, on: :member
  end

  namespace :api do
    resources :users, only: [:index, :create]
    resources :oauth, only: [:show]
    resources :sessions, only: [:create] do
      delete :destroy, on: :collection
    end
  end
end
