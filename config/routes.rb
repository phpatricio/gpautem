Rails.application.routes.draw do


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

  # resources :convenios
get 'convenios/', to: 'convenios#index'
get 'convenios/nuevo', to: 'convenios#nuevo'
get 'convenios/crear'
post '/convenios', to: 'convenios#crear'
get 'convenios/:id', to: 'convenios#mostrar', as: 'convenio'
put 'convenios/:id', to: 'convenios#update'
patch '/convenios/:id', to: 'convenios#update'
get 'convenios/:id/editar', to: 'convenios#editar', as:'editar_convenio'
delete 'convenios/:id', to: 'convenios#eliminar', as: 'eliminar_convenio'

  #resources :herramienta
get 'herramientas/', to: 'herramienta#index'
get 'herramientas/nuevo', to: 'herramienta#nuevo'
get 'herramientas/crear'
post '/herramientas', to: 'herramienta#crear'
get 'herramientas/:id', to: 'herramienta#mostrar', as: 'herramienta'
put 'herramientas/:id', to: 'herramienta#update'
patch '/herramientas/:id', to: 'herramienta#update'
get 'herramientas/:id/editar', to: 'herramienta#editar', as:'editar_herramienta'
delete 'herramientas/:id', to: 'herramienta#eliminar', as: 'eliminar_herramienta'

  #resources :empresas
get 'empresas/', to: 'empresas#index'
get 'empresas/nuevo', to: 'empresas#nuevo'
get 'empresas/crear'
post '/empresas', to: 'empresas#crear'
get 'empresas/:id', to: 'empresas#mostrar', as: 'empresa'
put 'empresas/:id', to: 'empresas#update'
patch '/empresas/:id', to: 'empresas#update'
get 'empresas/:id/editar', to: 'empresas#editar', as:'editar_empresa'
delete 'empresas/:id', to: 'empresas#eliminar', as: 'eliminar_empresa'

  #resources :evaluacions
get 'evaluacions/', to: 'evaluacions#index'
get 'evaluacions/nuevo', to: 'evaluacions#nuevo'
get 'evaluacions/crear'
post '/evaluacions', to: 'evaluacions#crear'
get 'evaluacions/:id', to: 'evaluacions#mostrar', as: 'evaluacion'
put 'evaluacions/:id', to: 'evaluacions#update'
patch '/evaluacions/:id', to: 'evaluacions#update'
get 'evaluacions/:id/editar', to: 'evaluacions#editar', as:'editar_evaluacion'
delete 'evaluacions/:id', to: 'evaluacions#eliminar', as: 'eliminar_evaluacion'

  devise_for :users
  resources :alumnos
  get 'welcome/index'
  root :to => "welcome#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
