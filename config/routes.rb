Rails.application.routes.draw do
  resources :users
  resources :posts do
    member do
      get :get_comments
      get 'comments/:comment_id', to: 'posts#get_comment', as: 'get_comment'
      post :create_comment
      delete '/comments/:comment_id', to: 'posts#delete_comment', as: 'delete_comment'
      get 'likes', to: 'posts#show_likes', as: 'show_likes'
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