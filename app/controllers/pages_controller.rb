class PagesController < ApplicationController
  def home
    @dji_price = DjiPrice.last
    @dji_forecast = DjiForecast.last
  end

  def about
  end

  def stock
    @dji_prices = DjiPrice.all
  end
end
