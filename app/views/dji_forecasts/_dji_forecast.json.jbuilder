json.extract! dji_forecast, :id, :date, :close_arima, :close_nnet, :created_at, :updated_at
json.url dji_forecast_url(dji_forecast, format: :json)
