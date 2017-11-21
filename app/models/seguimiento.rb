class Seguimiento < ApplicationRecord
	has_one :practica
	validates :comentario_visita_1, presence: true
	validates :comentario_visita_2, presence: true
	validates :comentario_visita_3, presence: true
end
