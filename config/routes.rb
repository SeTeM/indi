Rails.application.routes.draw do
  root to: 'index#index'

  resource :index, only: [:index]

  get '/auth/:provider/callback', to: 'auth#callback'

  namespace :api do
    resources :users, only: [:index]
    resources :auth, only: [:show]
    resources :sessions, only: [] do
      delete :destroy, on: :collection
    end
  end
end
