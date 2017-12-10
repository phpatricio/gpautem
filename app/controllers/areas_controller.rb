class AreasController < ApplicationController
	before_action :set_area, only: [:mostrar, :editar, :update, :eliminar]
  before_action :authenticate_user!
  def index 
    @areas = Area.all.paginate(page: params[:page], per_page: 10)
  end

  def nuevo
    @areas = Area.new
  end

  def crear
    @areas = Area.new(area_params)
        respond_to do |format|
          if @areas.save
            format.html {redirect_to areas_path, notice: 'Se persistio el area'}
          else
            format.html {render :nuevo}
          end
        end
  end

  def mostrar
  end

  def update
    respond_to do |format|
      if @areas.update(area_params)
        format.html {redirect_to areas_path, notice: 'Se actualizaron los datos'}
      else
        format.html {render :editar}
      end
    end
  end

  def editar
  end

  def eliminar
    @areas.destroy
    respond_to do |format|
      format.html {redirect_to areas_path, notice: 'Se elimino el area'}
    end
  end

   def nuevo2
    @areas = Area.new
  end

  def crear2
    @areas = Area.new(area_params)
    if Area.where(nombre: @areas.nombre).blank? ==false
        @id = Area.new
        @id=Area.select("id").where("nombre= ?", @areas.nombre)
        respond_to do |format|
        format.html {redirect_to asignar_area_url(params[:id],@id.ids), notice: 'Se Persistio la area'}
        end
    else
      
      respond_to do |format|
         if @areas.save
              format.html {redirect_to asignar_area_url(params[:id],@areas), notice: 'Se Persistio la area'}
         else
               puts "no se guardo"
         end
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_area
      @areas = Area.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def area_params
      params.require(:area).permit(:nombre)
    end
end
