Rails.application.routes.draw do


  resources :galleries
  
  root to: 'rooms#statement'
  post 'rooms/disco' => 'rooms#disco'
  
  get 'discussion' => 'rooms#discussion', as: :discussion
  get 'contact' => 'rooms#contact', as: :contact
  get 'room/:id/edit' => 'rooms#edit', as: :edit_room_info
  patch 'room/:id/update' => 'rooms#update', as: :room
  post '/contact' => 'rooms#send_email', as: :send_email
  
  get 'users/login' => 'users#login', as: :login
  get 'users/logout' => 'users#logout', as: :logout
  get 'users/new' => 'users#new', as: :new_user
  post 'users/login' => 'users#submit_login', as: :submit_login
  get 'users/:id/edit' => 'users#edit', as: :edit_user
  post 'users/new' => 'users#create', as: :create_user
  delete 'users/:id' => 'users#destroy', as: :delete_account
  get 'users/newAdmin' => 'users#new_admin', as: :create_new_admin
  patch 'users/update' => 'users#update_password', as: :update_password
  
  post 'carts/addItem' => 'carts#add_item_to_cart'
  get 'carts/show' => 'carts#show'
  
  mount ActionCable.server => '/cable'

end
