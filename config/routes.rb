Rails.application.routes.draw do

  get 'potins/:id/:user', to: 'potins#user', as: 'users'
  get 'potins/:id', to: 'potins#show', as: 'potins'
  get 'create', to: 'potins#create'
  get 'welcome/:name', to: 'welcome#home', as: 'welcome'
  get 'team', to: 'statics#team'
  get 'contact', to: 'statics#contact'
  get '/', to: 'welcome#askname'
  post '/', to: 'welcome#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
