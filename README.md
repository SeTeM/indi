-> % bin/rake routes
      Prefix Verb   URI Pattern                        Controller#Action
        root GET    /                                  index#index
             GET    /auth/:provider/callback(.:format) auth#callback
   api_users GET    /api/users(.:format)               api/users#index
    api_auth GET    /api/auth/:id(.:format)            api/auth#show
api_sessions DELETE /api/sessions(.:format)            api/sessions#destroy

Чтобы получить урл на oauth, делаешь `GET /api/auth/google`
