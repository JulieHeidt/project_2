Rails.application.routes.draw do
root "posts#index"
  resources :users do
    resources :posts do
      resources :comments 
    end
  end

  # get "/users/:user_id/posts/:post_id/comments" => "comments#index"
  # post "/users/:user_id/posts/:post_id/comments" => "comments#create"
  # get "/users/:user_id/posts/:post_id/comments/new" => "comments#new", as: :new_user_post_comment
  # get "/users/:user_id/posts/:post_id/comments/:id/edit" => "comments#edit", as: :edit_user_post_comment
  # get "/users/:user_id/posts/:post_id/comments/:id" => "comments#show", as: :user_post_comment 
  # patch "/users/:user_id/posts/:post_id/comments/:id" => "comments#update"
  # put "/users/:user_id/posts/:post_id/comments/:id" => "comments#update"
  # delete "/users/:user_id/posts/:post_id/comments/:id" => "comments#destroy"

  # get "/users/:user_id/posts" => "posts#index", as: :user_posts
  # post "/users/:user_id/posts" => "posts#create"
  # get "/users/:user_id/posts/new" => "posts#new", as: :new_user_post
  # get "/users/:user_id/posts/:id/edit" => "posts#edit", as: :edit_user_post
  # get "/users/:user_id/posts/:id" => "posts#show", as: :user_post
  # patch "/users/:user_id/posts/:id" => "posts#update"
  # put "/users/:user_id/posts/:id" => "posts#update"
  # delete "/users/:user_id/posts/:id" => "posts#destroy", as: :delete_user_post

  # get "/users" => "users#index"
  # post "/users" => "users#create"
  # get "/users/new" => "users#new", as: :new_user
  # get "/users/:id/edit" => "users#edit", as: :edit_user 
  # get "/users/:id" => "users#show"
  # patch "/users/:id" => "users#update"
  # put "/users/:id" => "users#update"
  # delete "/users/:id" => "users#destroy"

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"

end
