class DjiForecastsController < ApplicationController
  before_action :set_dji_forecast, only: [:show, :edit, :update, :destroy]

  # GET /dji_forecasts
  # GET /dji_forecasts.json
  def index
    @dji_forecasts = DjiForecast.all.order("created_at desc").paginate(:page => params[:page], :per_page => 15)
  end

  # GET /dji_forecasts/1
  # GET /dji_forecasts/1.json
  def show
  end

  # GET /dji_forecasts/new
  def new
    @dji_forecast = DjiForecast.new
  end

  # GET /dji_forecasts/1/edit
  def edit
  end

  # POST /dji_forecasts
  # POST /dji_forecasts.json
  def create
    @dji_forecast = DjiForecast.new(dji_forecast_params)

    respond_to do |format|
      if @dji_forecast.save
        format.html { redirect_to @dji_forecast, notice: 'Dodano prognozę.' }
        format.json { render :show, status: :created, location: @dji_forecast }
      else
        format.html { render :new }
        format.json { render json: @dji_forecast.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dji_forecasts/1
  # PATCH/PUT /dji_forecasts/1.json
  def update
    respond_to do |format|
      if @dji_forecast.update(dji_forecast_params)
        format.html { redirect_to @dji_forecast, notice: 'Zmodyfikowano prognozę.' }
        format.json { render :show, status: :ok, location: @dji_forecast }
      else
        format.html { render :edit }
        format.json { render json: @dji_forecast.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dji_forecasts/1
  # DELETE /dji_forecasts/1.json
  def destroy
    @dji_forecast.destroy
    respond_to do |format|
      format.html { redirect_to dji_forecasts_url, notice: 'Usunięto prognozę.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dji_forecast
      @dji_forecast = DjiForecast.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dji_forecast_params
      params.require(:dji_forecast).permit({close_nnet: []}, {close_arima: []}, {date: []})
    end
end
