Rails.application.routes.draw do

  resources :convenios
  resources :seguimientos

  resources :herramienta


  resources :empresas

  resources :evaluacions

  devise_for :users
  resources :alumnos
  get 'welcome/index'
  root :to => "welcome#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
