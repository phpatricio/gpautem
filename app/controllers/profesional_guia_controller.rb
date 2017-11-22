class ProfesionalGuiaController < ApplicationController
	before_action :set_profesional_guia, only: [:mostrar, :editar, :update, :eliminar]
	before_action :authenticate_user!
	def index
		@profesionalGuia = ProfesionalGuia.all.paginate(page: params[:page], per_page: 5)
	end

	def mostrar
	end

	def eliminar
		@profesionalGuia.destroy
		respond_to do |format|
			format.html {redirect_to profesional_guia_index_path, notice: 'eliminado'}
		end
	end

	def update
		respond_to do |format|
      		if @profesionalGuia.update(profesionalGuia_params)
        		format.html {redirect_to profesional_guia_index_path, notice: 'Se Actualizaron los datos'}
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
        		format.html {redirect_to profesional_guia_index_path, notice: 'Se Persistio la persona'}
      		else
        		format.html {render :nuevo}
      		end
    	end
	end
		
	def editar
	end

	private

	def set_profesional_guia
    	@profesionalGuia = ProfesionalGuia.find(params[:id])
    end

	def profesionalGuia_params
		params.require(:profesional_guia).permit(:rut, :Nombre, :Cargo, :Email, :Direccion, :Telefono )
		
	end
end
