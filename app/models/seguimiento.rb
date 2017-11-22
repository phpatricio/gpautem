class Seguimiento < ApplicationRecord
	has_one :practica
	validates :fecha_1, date: true
	validates_presence_of :comentario_visita_1, message: ": por fa2or complete el espacio en blanco (campo obligatorio)"
	validates :fecha_2, date: true
	validates_presence_of :comentario_visita_2, message: ": por favor complete el espacio en blanco (campo obligatorio)"
	validates :fecha_3, date: true
	validates_presence_of :comentario_visita_3, message: ": por favor complete el espacio en blanco (campo obligatorio)"
	validates :fecha_1, date: { before: :fecha_2 }
	validates :fecha_2, date: { before: :fecha_3 }
end