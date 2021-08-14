require "application_system_test_case"

class FaturaOrdemServicosTest < ApplicationSystemTestCase
  setup do
    @fatura_ordem_servico = fatura_ordem_servicos(:one)
  end

  test "visiting the index" do
    visit fatura_ordem_servicos_url
    assert_selector "h1", text: "Fatura Ordem Servicos"
  end

  test "creating a Fatura ordem servico" do
    visit fatura_ordem_servicos_url
    click_on "New Fatura Ordem Servico"

    fill_in "Data", with: @fatura_ordem_servico.data
    fill_in "Numero", with: @fatura_ordem_servico.numero
    click_on "Create Fatura ordem servico"

    assert_text "Fatura ordem servico was successfully created"
    click_on "Back"
  end

  test "updating a Fatura ordem servico" do
    visit fatura_ordem_servicos_url
    click_on "Edit", match: :first

    fill_in "Data", with: @fatura_ordem_servico.data
    fill_in "Numero", with: @fatura_ordem_servico.numero
    click_on "Update Fatura ordem servico"

    assert_text "Fatura ordem servico was successfully updated"
    click_on "Back"
  end

  test "destroying a Fatura ordem servico" do
    visit fatura_ordem_servicos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fatura ordem servico was successfully destroyed"
  end
end
