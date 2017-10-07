json.extract! alumno, :id, :nombre, :apellido, :rut, :codigo_carrera, :semestre, :ano, :created_at, :updated_at
json.url alumno_url(alumno, format: :json)