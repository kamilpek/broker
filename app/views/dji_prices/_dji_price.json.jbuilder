json.extract! dji_price, :id, :date, :open, :high, :low, :close, :created_at, :updated_at
json.url dji_price_url(dji_price, format: :json)
