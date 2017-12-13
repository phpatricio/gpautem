class ConveniosController < ApplicationController
  before_action :set_convenio, only: [:mostrar, :editar, :update, :eliminar]
  before_action :authenticate_user!
  def index 
      @q = params[:q]
      if @q 
        @query = Convenio.where(:nombre => @q)
        @convenios = @query.paginate(page: params[:page], per_page: 5)
      else
        @convenios = Convenio.all.paginate(page: params[:page], per_page: 5)
      end
  end

  def nuevo
    @convenios = Convenio.new
  end

  def crear
    @convenios = Convenio.new(convenio_params)
        respond_to do |format|
          if @convenios.save
            format.html {redirect_to convenios_path, notice: 'Se creo convenio exitosamente'}
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
        format.html {redirect_to convenios_path, notice: 'Se actualizaron los datos exitosamente'}
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
      format.html {redirect_to convenios_path, notice: 'Se elimino convenio'}
    end
  end

  def nuevo2
    if current_user.role.nombre != 'secretaria'
        respond_to do |format|
          format.html {redirect_to welcome_index_path, notice: 'usted no cuenta con los permisos para acceder a esta url'}
        end
    end
    @convenios = Convenio.new
  end

  def crear2
    @convenios = Convenio.new(convenio_params)
    @convenios.nombre =@convenios.nombre.capitalize
    if Convenio.where(nombre: @convenios.nombre).blank? ==false
        @id = Convenio.new
        @id=Convenio.select("id").where("nombre= ?", @convenios.nombre)
        respond_to do |format|
        format.html {redirect_to asignar_convenio_url(params[:id],@id.ids), notice: 'Se creo convenio exitosamente'}
    end
    else

      respond_to do |format|
          if @convenios.save
              format.html {redirect_to asignar_convenio_url(params[:id],@convenios), notice: 'Se creo convenio exitosamente'}
            else
              format.html {render :nuevo2}
              #puts "no se guardo"
            end
        end
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
