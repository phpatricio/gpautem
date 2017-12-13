class Seguimiento < ApplicationRecord
	has_one :practica, dependent: :destroy
	#validates :fecha_1, date: true
	validates_presence_of :comentario_visita_1, message: ": por fa2or complete el espacio en blanco (campo obligatorio)"
	#validates :fecha_2, date: true
	validates_presence_of :comentario_visita_2, message: ": por favor complete el espacio en blanco (campo obligatorio)"
	#validates :fecha_3, date: true
	validates_presence_of :comentario_visita_3, message: ": por favor complete el espacio en blanco (campo obligatorio)"
	validate :fecha_correcta
	
	def fecha_correcta
		

			if fecha_1 < fecha_2
			  errors.add(:fecha_1, "La fecha de termino no puede ser inferior a la fecha de inicio")
			end

			
	end
end