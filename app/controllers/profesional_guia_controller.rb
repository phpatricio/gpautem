class ProfesionalGuiaController < ApplicationController
	before_action :set_profesional_guia, only: [:mostrar, :editar, :update, :eliminar]
	before_action :authenticate_user!
	def index
		@profesionalGuia = ProfesionalGuia.all.paginate(page: params[:page], per_page: 10)
	end

	def mostrar
	end

	def eliminar
		@profesionalGuia.destroy
		respond_to do |format|
			format.html {redirect_to profesional_guia_index_path, notice: 'Se elimino Profesional Guia'}
		end
	end

	def update
		respond_to do |format|
      		if @profesionalGuia.update(profesionalGuia_params)
        		format.html {redirect_to profesional_guia_index_path, notice: 'Se Actualizaron los datos exitosamente'}
      		else
        		format.html {render :editar}
      		end
    	end
  	end

	def nuevo
		@profesionalGuia = ProfesionalGuia.new
	end
	def crear
		@profesionalGuia = ProfesionalGuia.new(profesionalGuia_params)
		
		respond_to do |format|
     	 	if @profesionalGuia.save
        		format.html {redirect_to profesional_guia_index_path, notice: 'Se creo Profesional Guia exitosamente'}
      		else
        		format.html {render :nuevo}
      		end
    	end
	end
		
	def editar
	if current_user.role.nombre != 'secretaria'
        respond_to do |format|
          format.html {redirect_to welcome_index_path, notice: 'usted no cuenta con los permisos para acceder a esta url'}
        end
    end
	end
	def nuevo2
		if current_user.role.nombre != 'secretaria'
        respond_to do |format|
          format.html {redirect_to welcome_index_path, notice: 'usted no cuenta con los permisos para acceder a esta url'}
        end
    end
		@profesionalGuia = ProfesionalGuia.new
	end

	def crear2
		@profesionalGuia = ProfesionalGuia.new(profesionalGuia_params)
		respond_to do |format|
     	 	if @profesionalGuia.save
        		format.html {redirect_to asignar_profesionalGuia_url(params[:id],@profesionalGuia), notice: 'Se creo Profesional Guia exitosamente'}
      		else
        		format.html {render :nuevo2}
        		puts "no se guardo"
      		end
    	end
	end

	private

	def set_profesional_guia
    	@profesionalGuia = ProfesionalGuia.find(params[:id])
    end

	def profesionalGuia_params
		params.require(:profesional_guia).permit(:rut, :Nombre, :Cargo, :Email, :Direccion, :Telefono )
		
	end
end
