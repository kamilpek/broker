require 'test_helper'

class DjiForecastsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dji_forecast = dji_forecasts(:one)
  end

  test "should get index" do
    get dji_forecasts_url
    assert_response :success
  end

  test "should get new" do
    get new_dji_forecast_url
    assert_response :success
  end

  test "should create dji_forecast" do
    assert_difference('DjiForecast.count') do
      post dji_forecasts_url, params: { dji_forecast: { close_arima: @dji_forecast.close_arima, close_nnet: @dji_forecast.close_nnet, date: @dji_forecast.date } }
    end

    assert_redirected_to dji_forecast_url(DjiForecast.last)
  end

  test "should show dji_forecast" do
    get dji_forecast_url(@dji_forecast)
    assert_response :success
  end

  test "should get edit" do
    get edit_dji_forecast_url(@dji_forecast)
    assert_response :success
  end

  test "should update dji_forecast" do
    patch dji_forecast_url(@dji_forecast), params: { dji_forecast: { close_arima: @dji_forecast.close_arima, close_nnet: @dji_forecast.close_nnet, date: @dji_forecast.date } }
    assert_redirected_to dji_forecast_url(@dji_forecast)
  end

  test "should destroy dji_forecast" do
    assert_difference('DjiForecast.count', -1) do
      delete dji_forecast_url(@dji_forecast)
    end

    assert_redirected_to dji_forecasts_url
  end
end
