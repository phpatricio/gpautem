class AlumnosController < ApplicationController
  load_and_authorize_resource
  before_action :set_alumno, only: [:show, :edit, :editar2, :update, :update2, :destroy]
  before_action :authenticate_user!

  # GET /alumnos
  # GET /alumnos.json
  
  def index
      authorize! :index,@alumnos
      if (current_user.role.nombre == "admin")
        @q = params[:q]
          if @q 
            @query = Alumno.where(:rut => @q)
            @alumnos = @query.paginate(page: params[:page], per_page: 5)
          else
            @alumnos = Alumno.all.paginate(page: params[:page], per_page: 5)
          end
      
      end
      if (current_user.role.nombre == "profesorguia")
      @alumnos = Alumno.where(user_id: current_user.id).where("ano = ?", Date.current.year).all.paginate(page: params[:page], per_page: 10)
      end
  end

    def alumnos_pendientes
      @alumnos = Alumno.all.where(ano: Date.current.year).paginate(page: params[:page], per_page: 10)   
  end

  def alumnos_sin_asignar
    @alumnos = Alumno.joins(:practica).where(user_id: nil,ano: Date.current.year)
  end

  # GET /alumnos/1
  # GET /alumnos/1.json
  def show
    authorize! :show,@alumnos
  end

  # GET /alumnos/new
  def new
    authorize! :new,@alumnos
    @alumno = Alumno.new
  end

  # GET /alumnos/1/edit
  def edit
    authorize! :edit,@alumnos
  end

  # POST /alumnos
  # POST /alumnos.json
  def create
    @alumno = Alumno.new(alumno_params)

    respond_to do |format|
      if @alumno.save
        format.html { redirect_to @alumno, notice: 'Alumno creado exitosamente.' }
        format.json { render :show, status: :created, location: @alumno }
      else
        format.html { render :new }
        format.json { render json: @alumno.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alumnos/1
  # PATCH/PUT /alumnos/1.json
  def update
    respond_to do |format|
      if @alumno.update(alumno_params)
        format.html { redirect_to @alumno, notice: 'Alumno editado con exito' }
        format.json { render :show, status: :ok, location: @alumno }
      else
        format.html { render :edit }
        format.json { render json: @alumno.errors, status: :unprocessable_entity }
      end
    end
  end

  def update2
    respond_to do |format|
      if @alumno.update(alumno_params)
        format.html { redirect_to alumnos_sin_asignar_path, notice: 'Alumno asignado con exito' }
      else
        format.html { render :edit }
        format.json { render json: @alumno.errors, status: :unprocessable_entity }
      end
    end
  end

  def editar2
  end

  def listar_alumnos
    @alumnos = Alumno.where(user_id: current_user.id).where("ano = ?", Date.current.year).all
    
  end

  # DELETE /alumnos/1
  # DELETE /alumnos/1.json
  def destroy
    @alumno.destroy
    respond_to do |format|
      format.html { redirect_to alumnos_url, notice: 'Alumnos eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  def estadistica_alum
    @alum = Alumno.joins(:practica).select(:ano).group(:ano).count
    
  end

  def nuevo3
    @alumno = Alumno.new
  end

  def crear3
    @alumno = Alumno.new(alumno_params)
      respond_to do |format|
          if @alumno.save
              format.html {redirect_to welcome_index_path, notice: 'Se Persistio la persona'}
            else
              format.html {render :nuevo3}
              #puts "no se guardo"
            end
        end
  end

  def escoger_opcion
    @id=params[:id]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alumno
      @alumno = Alumno.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def alumno_params
      params.require(:alumno).permit(:nombre, :apellido, :rut, :codigo_carrera, :semestre, :ano, :user_id,:email)
    end
end
