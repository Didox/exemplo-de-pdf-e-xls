require 'test_helper'

class PostosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @posto = postos(:one)
  end

  test "should get index" do
    get postos_url
    assert_response :success
  end

  test "should get new" do
    get new_posto_url
    assert_response :success
  end

  test "should create posto" do
    assert_difference('Posto.count') do
      post postos_url, params: { posto: { nome: @posto.nome } }
    end

    assert_redirected_to posto_url(Posto.last)
  end

  test "should show posto" do
    get posto_url(@posto)
    assert_response :success
  end

  test "should get edit" do
    get edit_posto_url(@posto)
    assert_response :success
  end

  test "should update posto" do
    patch posto_url(@posto), params: { posto: { nome: @posto.nome } }
    assert_redirected_to posto_url(@posto)
  end

  test "should destroy posto" do
    assert_difference('Posto.count', -1) do
      delete posto_url(@posto)
    end

    assert_redirected_to postos_url
  end
end
