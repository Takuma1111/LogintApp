Rails.application.routes.draw do
  get 'tasks/index'
  root 'users#index'
  get 'users/new'
  get 'users/create'
  get 'tasks/index'
  get 'tasks/new'
  get 'users/login_form'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'login', to:'users#login'
  post 'users/create', to:'users#create'
  post 'tasks/create', to:'tasks#create'
end
