Rails.application.routes.draw do
  resources :users
  resources :posts do
    member do
      post :create_comment
      delete :delete_comment
      post :like
      delete :unlike
    end
  end
  resources :comments
  resources :likes

  post '/signup', to: "users#create"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
end