class EvaluacionsController < ApplicationController
  before_action :set_evaluacion, only: [:mostrar, :editar, :update, :eliminar]
  before_action :authenticate_user!
  def index 
    @evaluacions = Evaluacion.all.paginate(page: params[:page], per_page: 5)
  end

  def nuevo
    @evaluacions = Evaluacion.new
  end

  def crear
    @evaluacions = Evaluacion.new(evaluacion_params)
        respond_to do |format|
          if @evaluacions.save
            format.html {redirect_to evaluacions_path, notice: 'Se persistio la evaluacion'}
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
        format.html {redirect_to evaluacions_path, notice: 'Se actualizaron los datos'}
      else
        format.html {render :editar}
      end
    end
  end

  def editar
  end

  def eliminar
    @evaluacions.destroy
    respond_to do |format|
      format.html {redirect_to evaluacions_path, notice: 'Se elimino la evaluacion'}
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
