class PagesController < ApplicationController
  def home
    @dji_price = DjiPrice.last
    @dji_forecast = DjiForecast.last
    @dji_nlp = DjiNlp.last
  end

  def about
  end

  def stock
    @dji_prices = DjiPrice.all
  end

  def import_dji
    @last_date = DjiPrice.pluck(:date).last
    @last_date = "1986-05-26".to_date if @last_date.nil?
    file = open('https://stooq.com/q/d/l/?s=^dji&i=d').read
    csv = CSV.parse(file, :headers => true)
    csv.each do |row|
      if row['Date'].to_date <= @last_date
        puts "No new records."
      else
        DjiPrice.create(
          :date => row['Date'],
          :open => row['Open'],
          :high => row['High'],
          :low => row['Low'],
          :close => row['Close'])
        # puts "#{row['Date']} create. \n"
      end
    end
    redirect_to root_path, notice: 'Pobrano rekordy DJI.'
  end

  def forecast_dji
    forecast = `Rscript lib/tasks/forecast.R`
    csv = CSV.parse(forecast, :headers => true, :col_sep => ' ')
    DjiForecast.create(
      :date => csv['date'],
      :close_arima => csv['arima'],
      :close_nnet => csv['nnetar'],
    )
    redirect_to root_path, notice: 'Przeprowadzono prognozę dla DJI.'
  end

  def nlp_dji
    nlp = `Rscript lib/tasks/nlp.R`
    nlp_result = nlp[4..-2]
    nlp_result_int = 1 if nlp_result == "positive"
    nlp_result_int = 2 if nlp_result == "negative"
    DjiNlp.create!(
      :result => nlp_result,
      :result_int => nlp_result_int,
    )
    redirect_to root_path, notice: "Przeprowadzono analizę wiadomości dla DJI."
  end

end
