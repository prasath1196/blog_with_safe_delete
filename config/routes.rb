Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "posts#index"
  resources :posts
  resources :comments
  resources :trashes
  get '/posts/move_to_trash/:id', controller:  :posts, action: :move_to_trash, as: :trash_post
  get '/comments/move_to_trash/:id', controller:  :comments, action: :move_to_trash, as: :trash_comment
  get '/trashes/restore_posts/:id',controller: :trashes,action: :restore_post,
      as: :restore_post
  get '/trashes/restore_comment/:id',controller: :trashes,action: :restore_comment,
      as: :restore_comment
end
