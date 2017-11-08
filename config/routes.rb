Rails.application.routes.draw do
  resources :herramienta
  devise_for :users
  resources :alumnos
  resources :evaluacion
  get 'welcome/index'
  root :to => "welcome#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
