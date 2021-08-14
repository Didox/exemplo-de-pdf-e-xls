require "application_system_test_case"

class GrupoAcessosTest < ApplicationSystemTestCase
  setup do
    @grupo_acesso = grupo_acessos(:one)
  end

  test "visiting the index" do
    visit grupo_acessos_url
    assert_selector "h1", text: "Grupo Acessos"
  end

  test "creating a Grupo acesso" do
    visit grupo_acessos_url
    click_on "New Grupo Acesso"

    fill_in "Acessos", with: @grupo_acesso.acessos
    fill_in "Nome", with: @grupo_acesso.nome
    click_on "Create Grupo acesso"

    assert_text "Grupo acesso was successfully created"
    click_on "Back"
  end

  test "updating a Grupo acesso" do
    visit grupo_acessos_url
    click_on "Edit", match: :first

    fill_in "Acessos", with: @grupo_acesso.acessos
    fill_in "Nome", with: @grupo_acesso.nome
    click_on "Update Grupo acesso"

    assert_text "Grupo acesso was successfully updated"
    click_on "Back"
  end

  test "destroying a Grupo acesso" do
    visit grupo_acessos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Grupo acesso was successfully destroyed"
  end
end
