class CodigosController < ApplicationController
  before_action :set_codigo, only: [:show, :edit, :update, :destroy]

  # GET /codigos
  # GET /codigos.json
  def index
    @codigos = Codigo.all
  end

  # GET /codigos/1
  # GET /codigos/1.json
  def show
  end

  # GET /codigos/new
  def new
    @codigo = Codigo.new
  end

  # GET /codigos/1/edit
  def edit
  end

  # POST /codigos
  # POST /codigos.json
  def create
    @codigo = Codigo.new(codigo_params)

    respond_to do |format|
      if @codigo.save
        format.html { redirect_to @codigo, notice: 'Codigo was successfully created.' }
        format.json { render :show, status: :created, location: @codigo }
      else
        format.html { render :new }
        format.json { render json: @codigo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /codigos/1
  # PATCH/PUT /codigos/1.json
  def update
    respond_to do |format|
      if @codigo.update(codigo_params)
        format.html { redirect_to @codigo, notice: 'Codigo was successfully updated.' }
        format.json { render :show, status: :ok, location: @codigo }
      else
        format.html { render :edit }
        format.json { render json: @codigo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /codigos/1
  # DELETE /codigos/1.json
  def destroy
    @codigo.destroy
    respond_to do |format|
      format.html { redirect_to codigos_url, notice: 'Codigo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_codigo
      @codigo = Codigo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def codigo_params
      params.require(:codigo).permit(:codigo_carrera)
    end
end
