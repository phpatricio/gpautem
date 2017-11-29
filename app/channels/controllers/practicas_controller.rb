class PracticasController < ApplicationController
	before_action :set_practica, only: [:mostrar,:editar, :update, :eliminar]
	before_action :authenticate_user!
	def index
		@practica = Practica.all.paginate(page: params[:page], per_page: 5)
	end

	def nuevo
		@practica =Practica.new
	end

	def mostrar	
	end

	def crear
		@practica = Practica.new(practica_params)
		
		respond_to do |format|
     	 	if @practica.save
        		format.html {redirect_to practicas_path, notice: 'Se Persistio la persona'}
      		else
        		format.html {render :nuevo}
      		end
    	end
	end

	def update
		respond_to do |format|
			if @practica.update(practica_params)
        		format.html {redirect_to practicas_path, notice: 'Se Actualizaron los datos'}
      		else
        		format.html {render :editar}
      		end
    	end
  	end

  	def editar
	end

	def eliminar
		@practica.destroy
		respond_to do |format|
			format.html {redirect_to practicas_path, notice: 'eliminado'}
		end
	end

	private

		def set_practica
			@practica = Practica.find(params[:id])
		end

		def practica_params
			params.require(:practica).permit(:fecha_inicio, :fecha_termino, :descripcion_p,:profesional_guia_id)
		end
end
