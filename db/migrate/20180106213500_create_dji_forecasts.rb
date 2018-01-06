class CreateDjiForecasts < ActiveRecord::Migration[5.1]
  def change
    create_table :dji_forecasts do |t|
      t.date :date, array:true
      t.float :close_arima, array:true
      t.float :close_nnet, array:true

      t.timestamps
    end
  end
end
