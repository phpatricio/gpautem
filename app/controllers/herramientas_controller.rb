class HerramientasController < ApplicationController
	before_action :set_herramienta, only: [:mostrar, :editar, :update, :eliminar]
  before_action :authenticate_user!
  def index 
    @herramientas = Herramienta.all.paginate(page: params[:page], per_page: 5)
  end

  def nuevo
    @herramienta = Herramienta.new
  end

  def crear
    @herramienta = Herramienta.new(herramienta_params)
        respond_to do |format|
          if @herramienta.save
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
      if @herramienta.update(herramienta_params)
        format.html {redirect_to herramientas_path, notice: 'Se actualizaron los datos'}
      else
        format.html {render :editar}
      end
    end
  end

  def editar
  end

  def eliminar
    @herramienta.destroy
    respond_to do |format|
      format.html {redirect_to herramientas_path, notice: 'Se elimino la herramienta'}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_herramienta
      @herramienta = Herramienta.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def herramienta_params
      params.require(:herramienta).permit( :nombre)
    end
end
