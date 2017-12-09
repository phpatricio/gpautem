class EmpresasController < ApplicationController
  before_action :set_empresa, only: [:mostrar, :editar, :update, :eliminar]
  before_action :authenticate_user!
  def index 
    @empresas = Empresa.all.paginate(page: params[:page], per_page: 5)
  end

  def nuevo
    @empresas = Empresa.new
  end

  def crear
    @empresas = Empresa.new(empresa_params)
        respond_to do |format|
          if @empresas.save
            format.html {redirect_to empresas_path, notice: 'Se persistio la empresa'}
          else
            format.html {render :nuevo}
          end
        end
  end

  def mostrar
  end

  def update
    respond_to do |format|
      if @empresas.update(empresa_params)
        format.html {redirect_to empresas_path, notice: 'Se actualizaron los datos'}
      else
        format.html {render :editar}
      end
    end
  end

  def editar
  end

  def eliminar
    @empresas.destroy
    respond_to do |format|
      format.html {redirect_to empresas_path, notice: 'Se elimino la empresa'}
    end
  end

  def nuevo2
    @empresas = Empresa.new
  end

  def crear2
    @empresas = Empresa.new(empresa_params)
    @empresas.nombre_empresa =@empresas.nombre_empresa.capitalize
    if Empresa.where(nombre_empresa: @empresas.nombre_empresa).blank? ==false
        @id = Empresa.new
        @id=Empresa.select("id").where("nombre_empresa= ?", @empresas.nombre_empresa)
        respond_to do |format|
        format.html {redirect_to asignarEmpresas_url(params[:id],@id.ids), notice: 'Se Persistio la empresa'}
    end
    else
    
    respond_to do |format|
        if @empresas.save
            format.html {redirect_to asignarEmpresas_url(params[:id],@empresas.id), notice: 'Se Persistio la empresa'}
          else
            format.html {render :nuevo2}
            puts "no se guardo"
          end
      end
    end
  end

  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empresa
      @empresas = Empresa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def empresa_params
      params.require(:empresa).permit(:rut_empresa, :nombre_empresa)
    end
end
