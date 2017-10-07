class EvaluacionController < ApplicationController
  before_action :set_evaluacion, only: [:show, :edit, :update, :destroy]

  # GET /alumnos
  # GET /alumnos.json
  def index
    @evaluacions = Evaluacion.all
  end

  # GET /alumnos/1
  # GET /alumnos/1.json
  def show
  end

  # GET /alumnos/new
  def new
    @evaluacion = Evaluacion.new
  end

  # GET /alumnos/1/edit
  def edit
  end

  # POST /alumnos
  # POST /alumnos.json
  def create
    @evaluacion = Evaluacion.new(alumno_params)

    respond_to do |format|
      if @evaluacion.save
        format.html { redirect_to @evaluacion, notice: 'Alumno was successfully created.' }
        format.json { render :show, status: :created, location: @evaluacion }
      else
        format.html { render :new }
        format.json { render json: @evaluacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /evaluacions/1
  # PATCH/PUT /evaluacions/1.json
  def update
    respond_to do |format|
      if @evaluacion.update(evaluacion_params)
        format.html { redirect_to @evaluacion, notice: 'evaluacion was successfully updated.' }
        format.json { render :show, status: :ok, location: @evaluacion }
      else
        format.html { render :edit }
        format.json { render json: @evaluacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evaluacions/1
  # DELETE /evaluacions/1.json
  def destroy
    @evaluacion.destroy
    respond_to do |format|
      format.html { redirect_to evaluacions_url, notice: 'evaluacion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evaluacion
      @evaluacion = Evaluacion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evaluacion_params
      params.require(:evaluacion).permit(:pregunta_1, :pregunta_2, :pregunta_3, :pregunta_4, :pregunta_5, :pregunta_6,:pregunta_7,:pregunta_8,:observacion,:fecha_e,:nota)
    end
end
