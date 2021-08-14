require "application_system_test_case"

class FaturaCombustiveisTest < ApplicationSystemTestCase
  setup do
    @fatura_combustivel = fatura_combustiveis(:one)
  end

  test "visiting the index" do
    visit fatura_combustiveis_url
    assert_selector "h1", text: "Fatura Combustiveis"
  end

  test "creating a Fatura combustivel" do
    visit fatura_combustiveis_url
    click_on "New Fatura Combustivel"

    fill_in "Data", with: @fatura_combustivel.data
    fill_in "Numero", with: @fatura_combustivel.numero
    click_on "Create Fatura combustivel"

    assert_text "Fatura combustivel was successfully created"
    click_on "Back"
  end

  test "updating a Fatura combustivel" do
    visit fatura_combustiveis_url
    click_on "Edit", match: :first

    fill_in "Data", with: @fatura_combustivel.data
    fill_in "Numero", with: @fatura_combustivel.numero
    click_on "Update Fatura combustivel"

    assert_text "Fatura combustivel was successfully updated"
    click_on "Back"
  end

  test "destroying a Fatura combustivel" do
    visit fatura_combustiveis_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fatura combustivel was successfully destroyed"
  end
end
