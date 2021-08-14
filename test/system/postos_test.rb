require "application_system_test_case"

class PostosTest < ApplicationSystemTestCase
  setup do
    @posto = postos(:one)
  end

  test "visiting the index" do
    visit postos_url
    assert_selector "h1", text: "Postos"
  end

  test "creating a Posto" do
    visit postos_url
    click_on "New Posto"

    fill_in "Nome", with: @posto.nome
    click_on "Create Posto"

    assert_text "Posto was successfully created"
    click_on "Back"
  end

  test "updating a Posto" do
    visit postos_url
    click_on "Edit", match: :first

    fill_in "Nome", with: @posto.nome
    click_on "Update Posto"

    assert_text "Posto was successfully updated"
    click_on "Back"
  end

  test "destroying a Posto" do
    visit postos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Posto was successfully destroyed"
  end
end
