Rails.application.routes.draw do


  resources :convenios


  #**********************************RUTAS AREA***********************************************
  get 'areas/', to: 'areas#index'
  get 'areas/nuevo', to: 'areas#nuevo'
  get 'areas/crear'
  post '/areas', to: 'areas#crear'
  get 'areas/:id', to: 'areas#mostrar', as: 'area'
  put 'areas/:id', to: 'areas#update'
  patch '/areas/:id', to: 'areas#update'
  get 'areas/:id/editar', to: 'areas#editar', as: 'editar_area'
  delete 'areas/:id', to: 'areas#eliminar',as: 'eliminar_area'
  #*******************************************************************************************


  #********************************RUTAS PRACTICA*********************************************
  get 'practicas/', to: 'practicas#index'
  get 'practicas/nuevo', to: 'practicas#nuevo'
  get 'practicas/crear'
  post '/practicas', to: 'practicas#crear'
  get 'practicas/:id', to: 'practicas#mostrar', as: 'practica'
  put 'practicas/:id', to: 'practicas#update'
  patch '/practicas/:id', to: 'practicas#update'
  get 'practicas/:id/editar', to: 'practicas#editar', as: 'editar_practica'
  delete 'practicas/:id', to: 'practicas#eliminar', as: 'eliminar_practica'
  
  #*******************************RUTAS SEGUIMIENTOS******************************************

  get 'seguimientos/', to: 'seguimientos#index'
  get 'seguimientos/nuevo', to: 'seguimientos#nuevo'
  get 'seguimientos/crear'
  post '/seguimientos', to: 'seguimientos#crear'
  get 'seguimientos/:id', to: 'seguimientos#mostrar', as: 'seguimiento'
  put 'seguimientos/:id', to: 'seguimientos#update'
  patch '/seguimientos/:id', to: 'seguimientos#update'
  get 'seguimientos/:id/editar', to: 'seguimientos#editar', as: 'editar_seguimiento'
  delete 'seguimientos/:id', to: 'seguimientos#eliminar', as: 'eliminar_seguimiento'
  #*******************************************************************************************

  resources :herramienta

  #*****************************RUTAS PROFESIONAL GUIA****************************************
  get 'profesional_guia/', to: 'profesional_guia#index', as: 'profesional_guia_index'
  get 'profesional_guia/nuevo'
  get 'profesional_guia/crear'
  post '/profesional_guia', to: 'profesional_guia#crear', as: 'crear_profesional_guia'
  put 'profesional_guia/:id', to: 'profesional_guia#update'
  patch '/profesional_guia/:id/editar', to: 'profesional_guia#update'


  get 'profesional_guia/:id', to: 'profesional_guia#mostrar', as: 'profesional_guia'
  get 'profesional_guia/:id/editar', to: 'profesional_guia#editar', as: 'profesional_guium'
  delete 'profesional_guia/:id', to: 'profesional_guia#eliminar'
#***********************************************************************************************




  resources :empresas

  resources :evaluacions

  devise_for :users
  resources :alumnos
  get 'welcome/index'
  root :to => "welcome#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
