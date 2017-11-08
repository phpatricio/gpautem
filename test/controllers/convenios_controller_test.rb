require 'test_helper'

class ConveniosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @convenio = convenios(:one)
  end

  test "should get index" do
    get convenios_url
    assert_response :success
  end

  test "should get new" do
    get new_convenio_url
    assert_response :success
  end

  test "should create convenio" do
    assert_difference('Convenio.count') do
      post convenios_url, params: { convenio: { descripcion: @convenio.descripcion, fecha_inicio: @convenio.fecha_inicio, fecha_termino: @convenio.fecha_termino, nombre: @convenio.nombre } }
    end

    assert_redirected_to convenio_url(Convenio.last)
  end

  test "should show convenio" do
    get convenio_url(@convenio)
    assert_response :success
  end

  test "should get edit" do
    get edit_convenio_url(@convenio)
    assert_response :success
  end

  test "should update convenio" do
    patch convenio_url(@convenio), params: { convenio: { descripcion: @convenio.descripcion, fecha_inicio: @convenio.fecha_inicio, fecha_termino: @convenio.fecha_termino, nombre: @convenio.nombre } }
    assert_redirected_to convenio_url(@convenio)
  end

  test "should destroy convenio" do
    assert_difference('Convenio.count', -1) do
      delete convenio_url(@convenio)
    end

    assert_redirected_to convenios_url
  end
end
