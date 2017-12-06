class SeguimientosController < ApplicationController
  before_action :set_seguimiento, only: [:mostrar, :editar, :update, :eliminar]
  before_action :authenticate_user!
  def index
    @seguimientos = Seguimiento.all.paginate(page: params[:page], per_page: 10)
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
        format.html {render :editar}
      end
    end
  end


  def eliminar
    @seguimiento.destroy
    respond_to do |format|
      format.html {redirect_to seguimientos_path, notice: 'eliminado'}
    end
  end

  def crear2
    @seguimiento = Seguimiento.new
    @seguimiento.fecha_1 = Date.parse("Dec 8 1993")
    @seguimiento.fecha_2 = Date.parse("Dec 9 1993")
    @seguimiento.fecha_3 = Date.parse("Dec 10 1993")
    @seguimiento.comentario_visita_1 = "observacion 1"
    @seguimiento.comentario_visita_2 = "observacion 2"
    @seguimiento.comentario_visita_3 = "observacion 3"
    respond_to do |format|
        if @seguimiento.save
            format.html {redirect_to asignar_seguimiento_url(params[:id],@seguimiento), notice: 'Se Persistio la persona'}
          else
            
            puts "no se guardo"
          end
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
