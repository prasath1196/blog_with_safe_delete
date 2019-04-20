Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "posts#index"
  resources :posts
  resources :comments
  get '/posts/move_to_trash/:id', controller:  :posts, action: :move_to_trash, as: :trash_post
  get '/comments/move_to_trash/:id', controller:  :comments, action: :move_to_trash, as: :trash_comment

end
