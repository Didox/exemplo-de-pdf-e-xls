require 'test_helper'

class FaturaOrdemServicosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fatura_ordem_servico = fatura_ordem_servicos(:one)
  end

  test "should get index" do
    get fatura_ordem_servicos_url
    assert_response :success
  end

  test "should get new" do
    get new_fatura_ordem_servico_url
    assert_response :success
  end

  test "should create fatura_ordem_servico" do
    assert_difference('FaturaOrdemServico.count') do
      post fatura_ordem_servicos_url, params: { fatura_ordem_servico: { data: @fatura_ordem_servico.data, numero: @fatura_ordem_servico.numero } }
    end

    assert_redirected_to fatura_ordem_servico_url(FaturaOrdemServico.last)
  end

  test "should show fatura_ordem_servico" do
    get fatura_ordem_servico_url(@fatura_ordem_servico)
    assert_response :success
  end

  test "should get edit" do
    get edit_fatura_ordem_servico_url(@fatura_ordem_servico)
    assert_response :success
  end

  test "should update fatura_ordem_servico" do
    patch fatura_ordem_servico_url(@fatura_ordem_servico), params: { fatura_ordem_servico: { data: @fatura_ordem_servico.data, numero: @fatura_ordem_servico.numero } }
    assert_redirected_to fatura_ordem_servico_url(@fatura_ordem_servico)
  end

  test "should destroy fatura_ordem_servico" do
    assert_difference('FaturaOrdemServico.count', -1) do
      delete fatura_ordem_servico_url(@fatura_ordem_servico)
    end

    assert_redirected_to fatura_ordem_servicos_url
  end
end
