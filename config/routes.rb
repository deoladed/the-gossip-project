Rails.application.routes.draw do
  get 'tags/create'
  get 'likes/create'
  get 'cities/show'
  get 'cities/index'
  get 'city/show'
  get 'city/index'
  get 'comments/create'
  get 'user/show'

  resources :potins do
    resources :user, only: [:show]
    resources :comments, only: [:create]
  end
  resources :user, only: [:index]
  resources :cities, only: [:index, :show]
  resources :comments, except: [:create]
  resources :likes, only: [:new, :create]
  resources :connexion
  resources :sessions, only: [:new, :create, :destroy]
  # get 'potins/:id/:user', to: 'potins#user', as: 'users'
  # get 'potins/:id', to: 'potins#show', as: 'potins'
  # post 'potins/:id', to: 'potins#show', as: 'comment'
  # get 'create', to: 'potins#create'
  # get 'edit', to: 'potins#edit'

  # post 'gossips', to: 'welcome#home'
  # get 'gossips', to: 'welcome#home'
  # get 'welcome/:name', to: 'welcome#home', as: 'welcome'

  get 'user/:id', to: 'user#potins', as: 'potins_user'
  get 'team', to: 'statics#team'
  get 'contact', to: 'statics#contact'
  get '/', to: 'welcome#askname', as: 'welcome'
  post '/', to: 'user#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
