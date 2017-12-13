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
    if current_user.role.nombre != 'profesorguia'
        respond_to do |format|
          format.html {redirect_to welcome_index_path, notice: 'usted no cuenta con los permisos para acceder a esta url'}
        end
    end
  end


  def crear
    @seguimiento = Seguimiento.new(seguimiento_params)

    respond_to do |format|
      if @seguimiento.save
        format.html {redirect_to seguimientos_path, notice: 'Se creao seguimiento exitosamente'}
      else
        format.html {render :nuevo}
      end
    end
  end


  def update
    respond_to do |format|
      if @seguimiento.update(seguimiento_params)
        format.html {redirect_to alumnos_path, notice: 'Se Actualizaron los datos exitosamente'}
      else
        format.html {render :editar}
      end
    end
  end


  def eliminar
    @seguimiento.destroy
    respond_to do |format|
      format.html {redirect_to seguimientos_path, notice: 'Se elimino seguimiento'}
    end
  end

  def crear2
    @seguimiento = Seguimiento.new
    @seguimiento.fecha_1 = Date.current
    @seguimiento.fecha_2 = Date.current + 20.day
    @seguimiento.fecha_3 = Date.current + 40.day
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
