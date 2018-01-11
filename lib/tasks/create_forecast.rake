desc "Create DJI index forecast"
task :create_forecast => :environment do
  forecast = build_create_forecast
  if forecast.nil?
    puts "Something is wrong."
  else
    puts "Successfull import."
  end
end

def build_create_forecast
  puts "Forecast begining.\n"
  forecast = `Rscript lib/tasks/forecast.R`
  csv = CSV.parse(forecast, :headers => true, :col_sep => ' ')
  DjiForecast.create(
    :date => csv['date'],
    :close_arima => csv['arima'],
    :close_nnet => csv['nnetar'],
  )
end
