require 'test_helper'

class ArquivoFuncionariosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @arquivo_funcionario = arquivo_funcionarios(:one)
  end

  test "should get index" do
    get arquivo_funcionarios_url
    assert_response :success
  end

  test "should get new" do
    get new_arquivo_funcionario_url
    assert_response :success
  end

  test "should create arquivo_funcionario" do
    assert_difference('ArquivoFuncionario.count') do
      post arquivo_funcionarios_url, params: { arquivo_funcionario: { arquivo: @arquivo_funcionario.arquivo, funcionario_id: @arquivo_funcionario.funcionario_id } }
    end

    assert_redirected_to arquivo_funcionario_url(ArquivoFuncionario.last)
  end

  test "should show arquivo_funcionario" do
    get arquivo_funcionario_url(@arquivo_funcionario)
    assert_response :success
  end

  test "should get edit" do
    get edit_arquivo_funcionario_url(@arquivo_funcionario)
    assert_response :success
  end

  test "should update arquivo_funcionario" do
    patch arquivo_funcionario_url(@arquivo_funcionario), params: { arquivo_funcionario: { arquivo: @arquivo_funcionario.arquivo, funcionario_id: @arquivo_funcionario.funcionario_id } }
    assert_redirected_to arquivo_funcionario_url(@arquivo_funcionario)
  end

  test "should destroy arquivo_funcionario" do
    assert_difference('ArquivoFuncionario.count', -1) do
      delete arquivo_funcionario_url(@arquivo_funcionario)
    end

    assert_redirected_to arquivo_funcionarios_url
  end
end
