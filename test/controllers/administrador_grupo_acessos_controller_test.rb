require 'test_helper'

class AdministradorGrupoAcessosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @administrador_grupo_acesso = administrador_grupo_acessos(:one)
  end

  test "should get index" do
    get administrador_grupo_acessos_url
    assert_response :success
  end

  test "should get new" do
    get new_administrador_grupo_acesso_url
    assert_response :success
  end

  test "should create administrador_grupo_acesso" do
    assert_difference('AdministradorGrupoAcesso.count') do
      post administrador_grupo_acessos_url, params: { administrador_grupo_acesso: { administrador_id: @administrador_grupo_acesso.administrador_id, grupo_acesso_id: @administrador_grupo_acesso.grupo_acesso_id } }
    end

    assert_redirected_to administrador_grupo_acesso_url(AdministradorGrupoAcesso.last)
  end

  test "should show administrador_grupo_acesso" do
    get administrador_grupo_acesso_url(@administrador_grupo_acesso)
    assert_response :success
  end

  test "should get edit" do
    get edit_administrador_grupo_acesso_url(@administrador_grupo_acesso)
    assert_response :success
  end

  test "should update administrador_grupo_acesso" do
    patch administrador_grupo_acesso_url(@administrador_grupo_acesso), params: { administrador_grupo_acesso: { administrador_id: @administrador_grupo_acesso.administrador_id, grupo_acesso_id: @administrador_grupo_acesso.grupo_acesso_id } }
    assert_redirected_to administrador_grupo_acesso_url(@administrador_grupo_acesso)
  end

  test "should destroy administrador_grupo_acesso" do
    assert_difference('AdministradorGrupoAcesso.count', -1) do
      delete administrador_grupo_acesso_url(@administrador_grupo_acesso)
    end

    assert_redirected_to administrador_grupo_acessos_url
  end
end
