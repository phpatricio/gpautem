json.extract! evaluacion, :id, :pregunta_1, :pregunta_2, :pregunta_3, :pregunta_4, :pregunta_5, :pregunta_6,:pregunta_7,:pregunta_8, :created_at, :updated_at
json.url evaluacion_url(evaluacion, format: :json)
