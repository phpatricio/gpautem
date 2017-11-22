class ConveniosController < ApplicationController
  before_action :set_convenio, only: [:mostrar, :editar, :update, :eliminar]
  before_action :authenticate_user!
  def index 
    @convenios = Convenio.all.paginate(page: params[:page], per_page: 5)
  end

  def nuevo
    @convenios = Convenio.new
  end

  def crear
    @convenios = Convenio.new(convenio_params)
        respond_to do |format|
          if @convenios.save
            format.html {redirect_to convenios_path, notice: 'Se persistio el convenio'}
          else
            format.html {render :nuevo}
          end
        end
  end

  def mostrar
  end

  def update
    respond_to do |format|
      if @convenios.update(convenio_params)
        format.html {redirect_to convenios_path, notice: 'Se actualizaron los datos'}
      else
        format.html {render :editar}
      end
    end
  end

  def editar
    
  end

  def eliminar
    @convenios.destroy
    respond_to do |format|
      format.html {redirect_to convenios_path, notice: 'Se elimino el convenio'}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_convenio
      @convenios = Convenio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def convenio_params
      params.require(:convenio).permit(:nombre, :fecha_inicio, :fecha_termino, :descripcion)
    end
end
