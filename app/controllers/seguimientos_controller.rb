class SeguimientosController < ApplicationController
  before_action :set_seguimiento, only: [:mostrar, :editar, :update, :eliminar]
  before_action :authenticate_user!
  def index
    @seguimientos = Seguimiento.all
  end


  def mostrar
  end


  def nuevo
    @seguimiento = Seguimiento.new
  end


  def editar
  end


  def crear
    @seguimiento = Seguimiento.new(seguimiento_params)

    respond_to do |format|
      if @seguimiento.save
        format.html {redirect_to seguimientos_path, notice: 'Se Persistio el seguimiento'}
      else
        format.html {render :nuevo}
      end
    end
  end


  def update
    respond_to do |format|
      if @seguimiento.update(seguimiento_params)
        format.html {redirect_to seguimientos_path, notice: 'Se Actualizaron los datos'}
      else
        render :editar
      end
    end
  end


  def eliminar
    @seguimiento.destroy
    respond_to do |format|
      format.html {redirect_to seguimientos_path, notice: 'eliminado'}
    end
  end

  private
    
    def set_seguimiento
      @seguimiento = Seguimiento.find(params[:id])
    end

    
    def seguimiento_params
      params.require(:seguimiento).permit(:fecha_1, :comentario_visita_1, :fecha_2, :comentario_visita_2, :fecha_3, :comentario_visita_3)
    end
end
