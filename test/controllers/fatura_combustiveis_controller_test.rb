require 'test_helper'

class FaturaCombustiveisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fatura_combustivel = fatura_combustiveis(:one)
  end

  test "should get index" do
    get fatura_combustiveis_url
    assert_response :success
  end

  test "should get new" do
    get new_fatura_combustivel_url
    assert_response :success
  end

  test "should create fatura_combustivel" do
    assert_difference('FaturaCombustivel.count') do
      post fatura_combustiveis_url, params: { fatura_combustivel: { data: @fatura_combustivel.data, numero: @fatura_combustivel.numero } }
    end

    assert_redirected_to fatura_combustivel_url(FaturaCombustivel.last)
  end

  test "should show fatura_combustivel" do
    get fatura_combustivel_url(@fatura_combustivel)
    assert_response :success
  end

  test "should get edit" do
    get edit_fatura_combustivel_url(@fatura_combustivel)
    assert_response :success
  end

  test "should update fatura_combustivel" do
    patch fatura_combustivel_url(@fatura_combustivel), params: { fatura_combustivel: { data: @fatura_combustivel.data, numero: @fatura_combustivel.numero } }
    assert_redirected_to fatura_combustivel_url(@fatura_combustivel)
  end

  test "should destroy fatura_combustivel" do
    assert_difference('FaturaCombustivel.count', -1) do
      delete fatura_combustivel_url(@fatura_combustivel)
    end

    assert_redirected_to fatura_combustiveis_url
  end
end
