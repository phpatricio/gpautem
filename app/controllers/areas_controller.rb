class AreasController < ApplicationController
  before_action :set_area, only: [:mostrar, :editar, :update, :eliminar]

  def index
    @areas = Area.all
  end

  def mostrar
  end

  def nuevo
    @area = Area.new
  end

  def editar
  end

  def crear
    @area = Area.new(area_params)

    respond_to do |format|
      if @area.save
        format.html {redirect_to areas_path, notice: 'Se Persistio la persona'}
      else
        format.html {render :nuevo}
      end
    end
  end

  def update
    respond_to do |format|
      if @area.update(area_params)
        format.html {redirect_to areas_path, notice: 'Se Actualizaron los datos'}
      else
        render :editar
      end
    end
  end

  def eliminar
    @area.destroy
    respond_to do |format|
      format.html {redirect_to areas_path, notice: 'eliminado'}
    end
  end

  private

    def set_area
      @area = Area.find(params[:id])
    end

    def area_params
      params.require(:area).permit(:nombre)
    end
end
