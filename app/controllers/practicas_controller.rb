class PracticasController < ApplicationController
	before_action :set_practica, only: [:mostrar,:editar, :update, :eliminar]
	before_action :authenticate_user!
	def index
		@practica = Practica.all.paginate(page: params[:page], per_page: 10)
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

	def estadistica_herramienta
		@cant = Herramienta.joins(:practica).select(:nombre).group(:nombre).count
		
	end

	def estadistica_empresa
		@emp = Empresa.joins(:practica).select(:nombre_empresa).group(:nombre_empresa).count
		
	end

	def estadistica_area
		@are = Area.joins(:practica).select(:nombre).group(:nombre).count
		
	end

  def pregunta_convenio
    @id=Practica.find(params[:id])
  end  
	
	def nuevo2
		@practica =Practica.new
	end


	def crear2
		@practica = Practica.new(practica_params)
		
		respond_to do |format|
     	 	if @practica.save
        		format.html {redirect_to nuevo_profesionalGuia_url(@practica), notice: 'Se Persistio la persona'}
      		else
        		format.html {render :nuevo2}
      		end
    	end
	end

  def nuevo3
    @practica =Practica.new
  end


  def crear3
    @practica = Practica.new(practica_params)
    @practica.alumno_id=params[:id]
    respond_to do |format|
        if @practica.save
            format.html {redirect_to nuevo_profesionalGuia_url(@practica), notice: 'Se Persistio la persona'}
          else
            format.html {render :nuevo3}
          end
      end
  end

	def asignar_llaves_profesionalGuia
  		@practica = Practica.find(params[:id])
  		@practica.profesional_guia_id =params[:id2]
  		@practica.save
  		respond_to do |format|
  			format.html {redirect_to nueva_empresa_url(@practica), notice: 'Se persisitio los datos'}
  		end

  	end

  	def asignar_llaves_empresa
  		@practica = Practica.find(params[:id])
  		@practica.empresa_id =params[:id2]
  		@practica.save
  		respond_to do |format|
  			format.html {redirect_to preguntaC_url(params[:id]), notice: 'Se persisitio los datos'}
  		end

  	end
    def asignar_llaves_convenio
      @practica = Practica.find(params[:id])
      @practica.convenio_id =params[:id2]
      @practica.save
      respond_to do |format|
        format.html {redirect_to nueva_area_url(params[:id]), notice: 'Se persisitio los datos'}
      end

    end
  	def asignar_llaves_area
  		@practica = Practica.find(params[:id])
  		@practica.area_id =params[:id2]
  		@practica.save
  		respond_to do |format|
  			format.html {redirect_to nueva_herramienta_url(@practica), notice: 'Se persisitio los datos'}
  		end

  	end
  	def asignar_llaves_herramienta
  		@practica = Practica.find(params[:id])
  		@practica.herramienta_id =params[:id2]
  		@practica.save
  		respond_to do |format|
  			format.html {redirect_to crear_seguimientos2_url(@practica), notice: 'Se persisitio los datos'}
  		end

  	end
  	def asignar_llaves_seguimiento
  		@practica = Practica.find(params[:id])
  		@practica.seguimiento_id =params[:id2]
  		@practica.save
  		respond_to do |format|
  			format.html {redirect_to crear_evaluacion_url(@practica), notice: 'Se persisitio los datos'}
  		end

  	end
  	def asignar_llaves_evaluacion
  		@practica = Practica.find(params[:id])
  		@practica.evaluacion_id =params[:id2]
  		@practica.save
  		respond_to do |format|
  			format.html {redirect_to welcome_index_path, notice: 'Se ingreso la practica correctamente'}
  		end

  	end

    def sin_asignar
      @practica = Practica.all.where(alumno_id: nil).paginate(page: params[:page], per_page: 5)
    end

    def asignar
      @practica = Practica.find(params[:id])

    end

    def guardar_asignar
      @practica = Practica.find(params[:id])
      respond_to do |format|
      if @practica.update(practica_params)
            format.html {redirect_to sinAsignar_path, notice: 'Se Actualizaron los datos'}
          else
            render :editar
          end
      end
    end

  def practicas_disponibles
      @practicas = Practica.all.where("fecha_inicio >= ?", Date.current).where(alumno_id: nil)
  end

  def escoger_practica
    @practica =Practica.find(params[:id2])
    @empresa = Empresa.find(@practica.empresa_id)
    @guia = ProfesionalGuia.find(@practica.profesional_guia_id)
    @herramienta = Herramienta.find(@practica.herramienta_id)
    @area = Area.find(@practica.area_id)

  end

  def asignar_practica
    @practica = Practica.find(params[:id2])
    respond_to do |format|
      if @practica.update(alumno_id: params[:id])
        format.html {redirect_to welcome_index_path, notice: 'la practica se asigno con exito'}
      end
    end
  end

  def practicas_actuales
    @practica = Practica.all.where("fecha_inicio >= ?", Date.current).where(alumno_id: nil).paginate(page: params[:page], per_page: 10)
  end

  def mostrar2
    @practica = Practica.find(params[:id])
    @empresa = Empresa.find(@practica.empresa_id)
    @guia = ProfesionalGuia.find(@practica.profesional_guia_id)
    @herramienta = Herramienta.find(@practica.herramienta_id)
    @area = Area.find(@practica.area_id)
  end

  def info_contacto
    @practica = Practica.find(params[:id])
    @guia = ProfesionalGuia.find(@practica.profesional_guia_id)
    @empresa = Empresa.find(@practica.empresa_id)
  end
	private

		def set_practica
			@practica = Practica.find(params[:id])
		end

		def practica_params
			params.require(:practica).permit(:fecha_inicio, :fecha_termino, :descripcion_p)
		end
end
