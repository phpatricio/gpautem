Rails.application.routes.draw do
<<<<<<< HEAD
  resources :herramienta
=======

  resources :empresas
}
  resources :evaluacions
>>>>>>> 3de8a3be8d412598d545343a6902ccc263fc76c4
  devise_for :users
  resources :alumnos
  get 'welcome/index'
  root :to => "welcome#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
