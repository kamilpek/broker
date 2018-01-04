class DjiPricesController < ApplicationController
  before_action :set_dji_price, only: [:show, :edit, :update, :destroy]

  # GET /dji_prices
  # GET /dji_prices.json
  def index
    @dji_prices = DjiPrice.all.paginate(:page => params[:page], :per_page => 15)
  end

  # GET /dji_prices/1
  # GET /dji_prices/1.json
  def show
  end

  # GET /dji_prices/new
  def new
    @dji_price = DjiPrice.new
  end

  # GET /dji_prices/1/edit
  def edit
  end

  # POST /dji_prices
  # POST /dji_prices.json
  def create
    @dji_price = DjiPrice.new(dji_price_params)

    respond_to do |format|
      if @dji_price.save
        format.html { redirect_to @dji_price, notice: 'Dodano notowanie.' }
        format.json { render :show, status: :created, location: @dji_price }
      else
        format.html { render :new }
        format.json { render json: @dji_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dji_prices/1
  # PATCH/PUT /dji_prices/1.json
  def update
    respond_to do |format|
      if @dji_price.update(dji_price_params)
        format.html { redirect_to @dji_price, notice: 'Zmieniono notowanie.' }
        format.json { render :show, status: :ok, location: @dji_price }
      else
        format.html { render :edit }
        format.json { render json: @dji_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dji_prices/1
  # DELETE /dji_prices/1.json
  def destroy
    @dji_price.destroy
    respond_to do |format|
      format.html { redirect_to dji_prices_url, notice: 'Usunięto notowanie.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dji_price
      @dji_price = DjiPrice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dji_price_params
      params.require(:dji_price).permit(:date, :open, :high, :low, :close)
    end
end
