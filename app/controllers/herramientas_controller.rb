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

  def nuevo2
    @herramienta = Herramienta.new
  end

  def crear2
    @herramienta = Herramienta.new(herramienta_params)
    @herramienta.nombre =@herramienta.nombre.capitalize
    if Herramienta.where(nombre: @herramienta.nombre).blank? ==false
        @id = Herramienta.new
        @id=Herramienta.select("id").where("nombre= ?", @herramienta.nombre)
        respond_to do |format|
        format.html {redirect_to asignar_herramienta_url(params[:id],@id.ids), notice: 'Se Persistio la persona'}
    end
    else

      respond_to do |format|
          if @herramienta.save
              format.html {redirect_to asignar_herramienta_url(params[:id],@herramienta), notice: 'Se Persistio la persona'}
            else
              format.html {render :nuevo2}
              puts "no se guardo"
            end
        end
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
