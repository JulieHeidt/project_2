Rails.application.routes.draw do
  root "posts#index"
  resources :users do
    resources :posts do
    resources :comments 
    end
  end

  # delete "//users/:user_id/posts/:id", as: :delete_user_post => "posts#destroy"
  # get "users" => "users#index"
  # post "users" => "users#create"
  # get "users/new" => "users#new"
  # get "users/:id" => "users#show", as: :user

 
  # get "posts/" => "posts#index"
  # post "posts/" => "posts#create"
  # get "posts/new" => "posts#new", as: :new_post
  # get "posts/:id" => "posts#show"
  # get "posts/:id/edit" => "posts#edit"

  # post "comments" => "comments#new", as: :new_comment
  # post "comments" => "comments#create"
  # get "comments/:id" => "comments#show", as: :comment
  
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"
 
end
