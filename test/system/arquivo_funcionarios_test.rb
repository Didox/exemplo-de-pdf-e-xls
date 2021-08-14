require "application_system_test_case"

class ArquivoFuncionariosTest < ApplicationSystemTestCase
  setup do
    @arquivo_funcionario = arquivo_funcionarios(:one)
  end

  test "visiting the index" do
    visit arquivo_funcionarios_url
    assert_selector "h1", text: "Arquivo Funcionarios"
  end

  test "creating a Arquivo funcionario" do
    visit arquivo_funcionarios_url
    click_on "New Arquivo Funcionario"

    fill_in "Arquivo", with: @arquivo_funcionario.arquivo
    fill_in "Funcionario", with: @arquivo_funcionario.funcionario_id
    click_on "Create Arquivo funcionario"

    assert_text "Arquivo funcionario was successfully created"
    click_on "Back"
  end

  test "updating a Arquivo funcionario" do
    visit arquivo_funcionarios_url
    click_on "Edit", match: :first

    fill_in "Arquivo", with: @arquivo_funcionario.arquivo
    fill_in "Funcionario", with: @arquivo_funcionario.funcionario_id
    click_on "Update Arquivo funcionario"

    assert_text "Arquivo funcionario was successfully updated"
    click_on "Back"
  end

  test "destroying a Arquivo funcionario" do
    visit arquivo_funcionarios_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Arquivo funcionario was successfully destroyed"
  end
end
