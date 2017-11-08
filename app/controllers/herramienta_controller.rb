class HerramientaController < ApplicationController
  before_action :set_herramientum, only: [:show, :edit, :update, :destroy]

  # GET /herramienta
  # GET /herramienta.json
  def index
    @herramienta = Herramienta.all
  end

  # GET /herramienta/1
  # GET /herramienta/1.json
  def show
  end

  # GET /herramienta/new
  def new
    @herramienta = Herramienta.new
  end

  # GET /herramienta/1/edit
  def edit
  end

  # POST /herramienta
  # POST /herramienta.json
  def create
    @herramienta = Herramienta.new(herramienta_params)

    respond_to do |format|
      if @herramienta.save
        format.html { redirect_to @herramientum, notice: 'Herramientum was successfully created.' }
        format.json { render :show, status: :created, location: @herramientum }
      else
        format.html { render :new }
        format.json { render json: @herramientum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /herramienta/1
  # PATCH/PUT /herramienta/1.json
  def update
    respond_to do |format|
      if @herramienta.update(herramienta_params)
        format.html { redirect_to @herramienta, notice: 'herramienta was successfully updated.' }
        format.json { render :show, status: :ok, location: @herramienta }
      else
        format.html { render :edit }
        format.json { render json: @herramienta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /herramienta/1
  # DELETE /herramienta/1.json
  def destroy
    @herramienta.destroy
    respond_to do |format|
      format.html { redirect_to herramienta_url, notice: 'Herramientum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_herramientum
      @herramienta = Herramienta.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def herramienta_params
      params.fetch(:herramienta, {})
    end
end
