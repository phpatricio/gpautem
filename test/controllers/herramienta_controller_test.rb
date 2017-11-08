require 'test_helper'

class HerramientaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @herramientum = herramienta(:one)
  end

  test "should get index" do
    get herramienta_url
    assert_response :success
  end

  test "should get new" do
    get new_herramientum_url
    assert_response :success
  end

  test "should create herramientum" do
    assert_difference('Herramientum.count') do
      post herramienta_url, params: { herramientum: {  } }
    end

    assert_redirected_to herramientum_url(Herramientum.last)
  end

  test "should show herramientum" do
    get herramientum_url(@herramientum)
    assert_response :success
  end

  test "should get edit" do
    get edit_herramientum_url(@herramientum)
    assert_response :success
  end

  test "should update herramientum" do
    patch herramientum_url(@herramientum), params: { herramientum: {  } }
    assert_redirected_to herramientum_url(@herramientum)
  end

  test "should destroy herramientum" do
    assert_difference('Herramientum.count', -1) do
      delete herramientum_url(@herramientum)
    end

    assert_redirected_to herramienta_url
  end
end
