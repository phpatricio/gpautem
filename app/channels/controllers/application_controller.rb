class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from CanCan::AccessDenied do |exception|
	  flash[:error] = "Acceso denegado! recuerde sus privilegios de usuario!"
	  redirect_to root_url
	end
end
