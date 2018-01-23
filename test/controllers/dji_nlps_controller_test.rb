require 'test_helper'

class DjiNlpsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dji_nlp = dji_nlps(:one)
  end

  test "should get index" do
    get dji_nlps_url
    assert_response :success
  end

  test "should get new" do
    get new_dji_nlp_url
    assert_response :success
  end

  test "should create dji_nlp" do
    assert_difference('DjiNlp.count') do
      post dji_nlps_url, params: { dji_nlp: { result: @dji_nlp.result, result_int: @dji_nlp.result_int } }
    end

    assert_redirected_to dji_nlp_url(DjiNlp.last)
  end

  test "should show dji_nlp" do
    get dji_nlp_url(@dji_nlp)
    assert_response :success
  end

  test "should get edit" do
    get edit_dji_nlp_url(@dji_nlp)
    assert_response :success
  end

  test "should update dji_nlp" do
    patch dji_nlp_url(@dji_nlp), params: { dji_nlp: { result: @dji_nlp.result, result_int: @dji_nlp.result_int } }
    assert_redirected_to dji_nlp_url(@dji_nlp)
  end

  test "should destroy dji_nlp" do
    assert_difference('DjiNlp.count', -1) do
      delete dji_nlp_url(@dji_nlp)
    end

    assert_redirected_to dji_nlps_url
  end
end
