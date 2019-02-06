Rails.application.routes.draw do
  get 'comments/create'
  get 'user/show'

  resources :potins do
    resources :user, only: [:show]
    resources :comments, only: [:create]
  end
  resources :user, only: [:create]
  # get 'potins/:id/:user', to: 'potins#user', as: 'users'
  # get 'potins/:id', to: 'potins#show', as: 'potins'
  # post 'potins/:id', to: 'potins#show', as: 'comment'
  # get 'create', to: 'potins#create'
  # get 'edit', to: 'potins#edit'

  # post 'gossips', to: 'welcome#home'
  # get 'gossips', to: 'welcome#home'
  # get 'welcome/:name', to: 'welcome#home', as: 'welcome'


  get 'team', to: 'statics#team'
  get 'contact', to: 'statics#contact'
  get '/', to: 'welcome#askname', as: 'welcome'
  post '/', to: 'user#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
