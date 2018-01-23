class DjiNlpsController < ApplicationController
  before_action :set_dji_nlp, only: [:show, :edit, :update, :destroy]

  # GET /dji_nlps
  # GET /dji_nlps.json
  def index
    @dji_nlps = DjiNlp.all.order("created_at desc").paginate(:page => params[:page], :per_page => 15)
  end

  # GET /dji_nlps/1
  # GET /dji_nlps/1.json
  def show
  end

  # GET /dji_nlps/new
  def new
    @dji_nlp = DjiNlp.new
  end

  # GET /dji_nlps/1/edit
  def edit
  end

  # POST /dji_nlps
  # POST /dji_nlps.json
  def create
    @dji_nlp = DjiNlp.new(dji_nlp_params)

    respond_to do |format|
      if @dji_nlp.save
        format.html { redirect_to @dji_nlp, notice: 'Dodano wynik analizy.' }
        format.json { render :show, status: :created, location: @dji_nlp }
      else
        format.html { render :new }
        format.json { render json: @dji_nlp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dji_nlps/1
  # PATCH/PUT /dji_nlps/1.json
  def update
    respond_to do |format|
      if @dji_nlp.update(dji_nlp_params)
        format.html { redirect_to @dji_nlp, notice: 'Zmodyfikowano wynik analizy.' }
        format.json { render :show, status: :ok, location: @dji_nlp }
      else
        format.html { render :edit }
        format.json { render json: @dji_nlp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dji_nlps/1
  # DELETE /dji_nlps/1.json
  def destroy
    @dji_nlp.destroy
    respond_to do |format|
      format.html { redirect_to dji_nlps_url, notice: 'Usunięto wynik analizy.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dji_nlp
      @dji_nlp = DjiNlp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dji_nlp_params
      params.require(:dji_nlp).permit(:result, :result_int)
    end
end
