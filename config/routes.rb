Rails.application.routes.draw do


  resources :roles
  resources :codigos
  resources :semestres
  #resources :rols
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



  #----------------------rutas para formulario de ingreso de oferta de practica--------------

  get 'areas/nuevo2/:id', to: 'areas#nuevo2', as: 'nueva_area'
  post '/areas2/:id', to: 'areas#crear2', as: 'crear_area'
  get 'areas2/crear2'


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
  get 'estadistica_herramientas/', to: 'practicas#estadistica_herramienta'
  get 'estadistica_empresa/', to: 'practicas#estadistica_empresa'
  get 'estadistica_area/', to: 'practicas#estadistica_area'

  #----------------------rutas para formulario de ingreso de oferta de practica--------------

  get 'oferta/', to: 'practicas#nuevo2', as: 'nueva_oferta'
  get 'oferta/crear'
  post '/oferta', to: 'practicas#crear2', as: 'crear_oferta'


  get 'oferta2/:id', to: 'practicas#nuevo3', as: 'nueva_oferta3'
  post '/oferta2/:id', to: 'practicas#crear3', as: 'crear_oferta3'

  get 'pregunta_convenio/:id', to: 'practicas#pregunta_convenio', as: 'preguntaC'

  get 'practicasDisponibles/:id', to: 'practicas#practicas_disponibles', as: 'disponibles'
  get 'escogerPractica/:id/:id2', to: 'practicas#escoger_practica', as: 'ver_datos'
  get 'asignarPractica/:id/:id2', to: 'practicas#asignar_practica', as: 'esta_practica'

  get 'ver_actuales', to: 'practicas#practicas_actuales'

  get 'mostrartodasP/:id', to: 'practicas#mostrar2', as: 'mostrar_2'

  get 'contactar/:id', to: 'practicas#info_contacto', as: 'contactar'

  patch 'practicas/:id/:id2', to: 'practicas#asignar_llaves_profesionalGuia', as: 'asignar_profesionalGuia'
  put 'practicas/:id/:id2', to: 'practicas#asignar_llaves_profesionalGuia'
  get 'practicas/:id/:id2', to: 'practicas#asignar_llaves_profesionalGuia'

  patch 'practicas2/:id/:id2', to: 'practicas#asignar_llaves_empresa', as: 'asignarEmpresas'
  put 'practica2s/:id/:id2', to: 'practicas#asignar_llaves_empresa'
  get 'practicas2/:id/:id2', to: 'practicas#asignar_llaves_empresa'

  patch 'practicas3/:id/:id2', to: 'practicas#asignar_llaves_area', as: 'asignar_area'
  put 'practica3s/:id/:id2', to: 'practicas#asignar_llaves_area'
  get 'practicas3/:id/:id2', to: 'practicas#asignar_llaves_area'

  patch 'practicas4/:id/:id2', to: 'practicas#asignar_llaves_herramienta', as: 'asignar_herramienta'
  put 'practica4s/:id/:id2', to: 'practicas#asignar_llaves_herramienta'
  get 'practicas4/:id/:id2', to: 'practicas#asignar_llaves_herramienta'

  patch 'practicas5/:id/:id2', to: 'practicas#asignar_llaves_seguimiento', as: 'asignar_seguimiento'
  put 'practica5s/:id/:id2', to: 'practicas#asignar_llaves_seguimiento'
  get 'practicas5/:id/:id2', to: 'practicas#asignar_llaves_seguimiento'

  patch 'practicas6/:id/:id2', to: 'practicas#asignar_llaves_evaluacion', as: 'asignar_evaluacion'
  put 'practica6s/:id/:id2', to: 'practicas#asignar_llaves_evaluacion'
  get 'practicas6/:id/:id2', to: 'practicas#asignar_llaves_evaluacion'

  patch 'practicas7/:id/:id2', to: 'practicas#asignar_llaves_convenio', as: 'asignar_convenio'
  put 'practica7s/:id/:id2', to: 'practicas#asignar_llaves_convenio'
  get 'practicas7/:id/:id2', to: 'practicas#asignar_llaves_convenio'


  
  
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

  #----------------------rutas para formulario de ingreso de oferta de practica--------------

  get 'seguimientos2/:id', to: 'seguimientos#crear2', as: 'crear_seguimientos2'
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

  #----------------------rutas para formulario de ingreso de oferta de practica--------------

  get 'profesional_guia/nuevo2/:id', to: 'profesional_guia#nuevo2', as: 'nuevo_profesionalGuia'
  post '/profesional_guia2/:id', to: 'profesional_guia#crear2', as: 'crear_profesionalGuia'
  get 'profesional_guia2/crear2'
#***********************************************************************************************

#*****************************RUTAS CONVENIOS***************************************************
get 'convenios/', to: 'convenios#index'
get 'convenios/nuevo', to: 'convenios#nuevo'
get 'convenios/crear'
post '/convenios', to: 'convenios#crear'
get 'convenios/:id', to: 'convenios#mostrar', as: 'convenio'
put 'convenios/:id', to: 'convenios#update'
patch '/convenios/:id', to: 'convenios#update'
get 'convenios/:id/editar', to: 'convenios#editar', as:'editar_convenio'
delete 'convenios/:id', to: 'convenios#eliminar', as: 'eliminar_convenio'

#----------------------rutas para formulario de ingreso de oferta de practica--------------

get 'convenios/nuevo2/:id', to: 'convenios#nuevo2', as: 'nuevo_convenio'
post '/convenios2/:id', to: 'convenios#crear2', as: 'crear_convenio'
get 'convenios2/crear2'
#***********************************************************************************************

  #resources :herramienta
get 'herramientas/', to: 'herramientas#index', as: 'herramienta_index'
get 'herramientas/nuevo', to: 'herramientas#nuevo'
get 'herramientas/crear'
post '/herramientas', to: 'herramientas#crear'
get 'herramientas/:id', to: 'herramientas#mostrar', as: 'herramienta'
put 'herramientas/:id', to: 'herramientas#update'
patch '/herramientas/:id/editar', to: 'herramientas#update'
get 'herramientas/:id/editar', to: 'herramientas#editar', as:'herramientum'
delete 'herramientas/:id', to: 'herramientas#eliminar', as: 'eliminar_herramienta'
#----------------------rutas para formulario de ingreso de oferta de practica--------------

  get 'herramientas/nuevo2/:id', to: 'herramientas#nuevo2', as: 'nueva_herramienta'
  post '/herramientas2/:id', to: 'herramientas#crear2', as: 'crear_herramienta'
  get 'herramientas2/crear2'


#*********************************************************************************************

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

#----------------------rutas para formulario de ingreso de oferta de practica--------------

get 'empresas/nuevo2/:id', to: 'empresas#nuevo2', as: 'nueva_empresa'
post '/empresas2/:id', to: 'empresas#crear2', as: 'crear_empresa'
get 'empresas2/crear2'


#*************************************************************************************



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
#----------------------rutas para formulario de ingreso de oferta de practica--------------

  get 'evaluacions2/:id', to: 'evaluacions#crear2', as: 'crear_evaluacion'

#***************************************************************************************


  
get 'estadistica_alum/', to: 'alumnos#estadistica_alum'
put 'trato/:id', to: 'alumnos#update2'
patch '/trato/:id', to: 'alumnos#update2', as: 'ed'
get 'trato/:id/editar2', to: 'alumnos#editar2', as:'trato'
get 'alumnos_sin_asignar/', to: 'alumnos#alumnos_sin_asignar'
get 'listar_alumnos/', to: 'alumnos#listar_alumnos'


 #----------------------rutas para formulario de ingreso de oferta de practica--------------

  get 'ofertaAlumno/', to: 'alumnos#nuevo3' 
  post '/ofertaAlumno', to: 'alumnos#crear3', as: 'crear_alumno'

  get 'pregunta_alumno/:id', to: 'alumnos#escoger_opcion', as: 'preguntar'

  get 'Apendientes', to: 'alumnos#alumnos_pendientes'

  resources :alumnos
  get 'welcome/index'
  root :to => "welcome#index"
  devise_for :users, :controllers => { registrations: 'registrations' }
  get ':not_found' => 'welcome#index',
  :constraints => { :not_found => /.*/ }
  resources :user
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
