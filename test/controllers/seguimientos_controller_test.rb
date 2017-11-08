require 'test_helper'

class SeguimientosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @seguimiento = seguimientos(:one)
  end

  test "should get index" do
    get seguimientos_url
    assert_response :success
  end

  test "should get new" do
    get new_seguimiento_url
    assert_response :success
  end

  test "should create seguimiento" do
    assert_difference('Seguimiento.count') do
      post seguimientos_url, params: { seguimiento: { comentario_visita_1: @seguimiento.comentario_visita_1, comentario_visita_2: @seguimiento.comentario_visita_2, comentario_visita_3: @seguimiento.comentario_visita_3, fecha_1: @seguimiento.fecha_1, fecha_2: @seguimiento.fecha_2, fecha_3: @seguimiento.fecha_3 } }
    end

    assert_redirected_to seguimiento_url(Seguimiento.last)
  end

  test "should show seguimiento" do
    get seguimiento_url(@seguimiento)
    assert_response :success
  end

  test "should get edit" do
    get edit_seguimiento_url(@seguimiento)
    assert_response :success
  end

  test "should update seguimiento" do
    patch seguimiento_url(@seguimiento), params: { seguimiento: { comentario_visita_1: @seguimiento.comentario_visita_1, comentario_visita_2: @seguimiento.comentario_visita_2, comentario_visita_3: @seguimiento.comentario_visita_3, fecha_1: @seguimiento.fecha_1, fecha_2: @seguimiento.fecha_2, fecha_3: @seguimiento.fecha_3 } }
    assert_redirected_to seguimiento_url(@seguimiento)
  end

  test "should destroy seguimiento" do
    assert_difference('Seguimiento.count', -1) do
      delete seguimiento_url(@seguimiento)
    end

    assert_redirected_to seguimientos_url
  end
end
