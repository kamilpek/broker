require 'test_helper'

class DjiPricesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dji_price = dji_prices(:one)
  end

  test "should get index" do
    get dji_prices_url
    assert_response :success
  end

  test "should get new" do
    get new_dji_price_url
    assert_response :success
  end

  test "should create dji_price" do
    assert_difference('DjiPrice.count') do
      post dji_prices_url, params: { dji_price: { close: @dji_price.close, date: @dji_price.date, high: @dji_price.high, low: @dji_price.low, open: @dji_price.open } }
    end

    assert_redirected_to dji_price_url(DjiPrice.last)
  end

  test "should show dji_price" do
    get dji_price_url(@dji_price)
    assert_response :success
  end

  test "should get edit" do
    get edit_dji_price_url(@dji_price)
    assert_response :success
  end

  test "should update dji_price" do
    patch dji_price_url(@dji_price), params: { dji_price: { close: @dji_price.close, date: @dji_price.date, high: @dji_price.high, low: @dji_price.low, open: @dji_price.open } }
    assert_redirected_to dji_price_url(@dji_price)
  end

  test "should destroy dji_price" do
    assert_difference('DjiPrice.count', -1) do
      delete dji_price_url(@dji_price)
    end

    assert_redirected_to dji_prices_url
  end
end
