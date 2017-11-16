class HerramientaController < ApplicationController
  before_action :set_herramienta, only: [:mostrar, :editar, :update, :eliminar]

  def index 
    @herramientas = Herramienta.all
  end

  def nuevo
    @herramientas = Herramienta.new
  end

  def crear
    @herramientas = Herramienta.new(herramienta_params)
        respond_to do |format|
          if @herramientas.save
            format.html {redirect_to herramientas_path, notice: 'Se persistio la herramienta'}
          else
            format.html {render :nuevo}
          end
        end
  end

  def mostrar
  end

  def update
    respond_to do |format|
      if @herramientas.update(herramienta_params)
        format.html {redirect_to herramientas_path, notice: 'Se actualizaron los datos'}
      else
        render :editar
      end
    end
  end

  def editar
  end

  def eliminar
    @herramientas.destroy
    respond_to do |format|
      format.html {redirect_to herramientas_path, notice: 'Se elimino la herramienta'}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_herramienta
      @herramientas = Herramienta.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def herramienta_params
      params.require(:herramienta).permit( :nombre)
    end
end
