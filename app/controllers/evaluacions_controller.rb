class EvaluacionsController < ApplicationController
  before_action :set_evaluacion, only: [:mostrar, :editar, :update, :eliminar]
  before_action :authenticate_user!
  def index 
    @evaluacions = Evaluacion.all.paginate(page: params[:page], per_page: 10)
  end

  def nuevo
    @evaluacions = Evaluacion.new
  end

  def crear
    @evaluacions = Evaluacion.new(evaluacion_params)
        respond_to do |format|
          if @evaluacions.save
            format.html {redirect_to evaluacions_path, notice: 'Se creo evaluacion exitosamente'}
          else
            format.html {render :nuevo}
          end
        end
  end

  def mostrar
  end

  def update
    respond_to do |format|
      if @evaluacions.update(evaluacion_params)
        format.html {redirect_to alumnos_path, notice: 'Se actualizaron los datos exitosamente'}
      else
        format.html {render :editar}
      end
    end
  end

  def editar
    if current_user.role.nombre != 'profesorguia'
        respond_to do |format|
          format.html {redirect_to welcome_index_path, notice: 'usted no cuenta con los permisos para acceder a esta url'}
        end
    end
  end

  def eliminar
    @evaluacions.destroy
    respond_to do |format|
      format.html {redirect_to evaluacions_path, notice: 'Se elimino evaluacion'}
    end
  end
  def crear2
    @evaluacions = Evaluacion.new
    @evaluacions.pregunta_1 = 0
    @evaluacions.pregunta_2 = 0
    @evaluacions.pregunta_3 = 0
    @evaluacions.pregunta_4 = 0
    @evaluacions.pregunta_5 = 0
    @evaluacions.pregunta_6 = 0
    @evaluacions.pregunta_7 = 0
    @evaluacions.pregunta_8 = 0
    @evaluacions.observacion = "observacion"
    @evaluacions.fecha_evaluacion = Date.today.to_s
    @evaluacions.nota = 1.0
    @evaluacions.nota_informe_practica = 1.0
    respond_to do |format|
        if @evaluacions.save
            format.html {redirect_to asignar_evaluacion_url(params[:id],@evaluacions), notice: 'Se creo evaluacion exitosamente'}
          else
            format.html {render :nuevo2}
            puts "no se guardo"
          end
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evaluacion
      @evaluacions = Evaluacion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evaluacion_params
      params.require(:evaluacion).permit(:pregunta_1, :pregunta_2, :pregunta_3, :pregunta_4, :pregunta_5, :pregunta_6, :pregunta_7, :pregunta_8, :observacion, :fecha_evaluacion, :nota, :nota_informe_practica)
    end
end
