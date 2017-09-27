require 'test_helper'

class AlumnosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @alumno = alumnos(:one)
  end

  test "should get index" do
    get alumnos_url
    assert_response :success
  end

  test "should get new" do
    get new_alumno_url
    assert_response :success
  end

  test "should create alumno" do
    assert_difference('Alumno.count') do
      post alumnos_url, params: { alumno: { ano: @alumno.ano, apellido: @alumno.apellido, codigo_carrera: @alumno.codigo_carrera, nombre: @alumno.nombre, rut: @alumno.rut, semestre: @alumno.semestre } }
    end

    assert_redirected_to alumno_url(Alumno.last)
  end

  test "should show alumno" do
    get alumno_url(@alumno)
    assert_response :success
  end

  test "should get edit" do
    get edit_alumno_url(@alumno)
    assert_response :success
  end

  test "should update alumno" do
    patch alumno_url(@alumno), params: { alumno: { ano: @alumno.ano, apellido: @alumno.apellido, codigo_carrera: @alumno.codigo_carrera, nombre: @alumno.nombre, rut: @alumno.rut, semestre: @alumno.semestre } }
    assert_redirected_to alumno_url(@alumno)
  end

  test "should destroy alumno" do
    assert_difference('Alumno.count', -1) do
      delete alumno_url(@alumno)
    end

    assert_redirected_to alumnos_url
  end
end
