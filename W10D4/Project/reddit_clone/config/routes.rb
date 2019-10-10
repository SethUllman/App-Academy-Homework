Rails.application.routes.draw do
  resources :comments, only: [:create]
  resources :posts do
    resources :comments, only: [:new]
  end
  resources :posts, except: [:index]
  resources :subs 
  resources :users, only: [:new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resource :session, only: [:new, :create, :destroy]

end
