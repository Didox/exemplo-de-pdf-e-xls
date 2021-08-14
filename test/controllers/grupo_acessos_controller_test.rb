require 'test_helper'

class GrupoAcessosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @grupo_acesso = grupo_acessos(:one)
  end

  test "should get index" do
    get grupo_acessos_url
    assert_response :success
  end

  test "should get new" do
    get new_grupo_acesso_url
    assert_response :success
  end

  test "should create grupo_acesso" do
    assert_difference('GrupoAcesso.count') do
      post grupo_acessos_url, params: { grupo_acesso: { acessos: @grupo_acesso.acessos, nome: @grupo_acesso.nome } }
    end

    assert_redirected_to grupo_acesso_url(GrupoAcesso.last)
  end

  test "should show grupo_acesso" do
    get grupo_acesso_url(@grupo_acesso)
    assert_response :success
  end

  test "should get edit" do
    get edit_grupo_acesso_url(@grupo_acesso)
    assert_response :success
  end

  test "should update grupo_acesso" do
    patch grupo_acesso_url(@grupo_acesso), params: { grupo_acesso: { acessos: @grupo_acesso.acessos, nome: @grupo_acesso.nome } }
    assert_redirected_to grupo_acesso_url(@grupo_acesso)
  end

  test "should destroy grupo_acesso" do
    assert_difference('GrupoAcesso.count', -1) do
      delete grupo_acesso_url(@grupo_acesso)
    end

    assert_redirected_to grupo_acessos_url
  end
end
