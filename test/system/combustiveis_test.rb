require "application_system_test_case"

class CombustiveisTest < ApplicationSystemTestCase
  setup do
    @combustivel = combustiveis(:one)
  end

  test "visiting the index" do
    visit combustiveis_url
    assert_selector "h1", text: "Combustiveis"
  end

  test "creating a Combustivel" do
    visit combustiveis_url
    click_on "New Combustivel"

    fill_in "Data abastecimento", with: @combustivel.data_abastecimento
    fill_in "Litros", with: @combustivel.litros
    fill_in "Placa", with: @combustivel.placa
    fill_in "Valor", with: @combustivel.valor
    click_on "Create Combustivel"

    assert_text "Combustivel was successfully created"
    click_on "Back"
  end

  test "updating a Combustivel" do
    visit combustiveis_url
    click_on "Edit", match: :first

    fill_in "Data abastecimento", with: @combustivel.data_abastecimento
    fill_in "Litros", with: @combustivel.litros
    fill_in "Placa", with: @combustivel.placa
    fill_in "Valor", with: @combustivel.valor
    click_on "Update Combustivel"

    assert_text "Combustivel was successfully updated"
    click_on "Back"
  end

  test "destroying a Combustivel" do
    visit combustiveis_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Combustivel was successfully destroyed"
  end
end
