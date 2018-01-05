class PagesController < ApplicationController
  def home
    @dji_price = DjiPrice.last
  end

  def about
  end

  def stock
    @dji_prices = DjiPrice.all
  end
end
