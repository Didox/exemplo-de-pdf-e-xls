require "application_system_test_case"

class AdministradorGrupoAcessosTest < ApplicationSystemTestCase
  setup do
    @administrador_grupo_acesso = administrador_grupo_acessos(:one)
  end

  test "visiting the index" do
    visit administrador_grupo_acessos_url
    assert_selector "h1", text: "Administrador Grupo Acessos"
  end

  test "creating a Administrador grupo acesso" do
    visit administrador_grupo_acessos_url
    click_on "New Administrador Grupo Acesso"

    fill_in "Administrador", with: @administrador_grupo_acesso.administrador_id
    fill_in "Grupo acesso", with: @administrador_grupo_acesso.grupo_acesso_id
    click_on "Create Administrador grupo acesso"

    assert_text "Administrador grupo acesso was successfully created"
    click_on "Back"
  end

  test "updating a Administrador grupo acesso" do
    visit administrador_grupo_acessos_url
    click_on "Edit", match: :first

    fill_in "Administrador", with: @administrador_grupo_acesso.administrador_id
    fill_in "Grupo acesso", with: @administrador_grupo_acesso.grupo_acesso_id
    click_on "Update Administrador grupo acesso"

    assert_text "Administrador grupo acesso was successfully updated"
    click_on "Back"
  end

  test "destroying a Administrador grupo acesso" do
    visit administrador_grupo_acessos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Administrador grupo acesso was successfully destroyed"
  end
end
