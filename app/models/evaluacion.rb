class Evaluacion < ApplicationRecord
	has_one :practica
	#validates :pregunta_1, presence: true, message: "por favor complete el espacio en blanco (campo obligatorio)"
	validates_presence_of :pregunta_1, message: ": por favor complete el espacio en blanco (campo obligatorio)"
	validates_inclusion_of :pregunta_1, in: 0..16, message: ": puntaje ingresado no valido (el rango es de 0 a 16)"
	#validates :pregunta_1, numericality: true, message: "puntaje ingresado no es un numero entero"
	validates_numericality_of  :pregunta_1, message: ": puntaje ingresado no es un numero entero"

	validates_presence_of :pregunta_2, message: ": por favor complete el espacio en blanco (campo obligatorio)"
	validates_inclusion_of :pregunta_2, in: 0..16, message: ": puntaje ingresado no valido (el rango es de 0 a 16)"
	validates_numericality_of  :pregunta_2, message: ": puntaje ingresado no es un numero entero"
	
	validates_presence_of :pregunta_3, message: ": por favor complete el espacio en blanco (campo obligatorio)"
	validates_inclusion_of :pregunta_3, in: 0..16, message: ": puntaje ingresado no valido (el rango es de 0 a 16)"
	validates_numericality_of  :pregunta_3, message: ": puntaje ingresado no es un numero entero"
	
	validates_presence_of :pregunta_4, message: ": por favor complete el espacio en blanco (campo obligatorio)"
	validates_inclusion_of :pregunta_4, in: 0..16, message: ": puntaje ingresado no valido (el rango es de 0 a 16)"
	validates_numericality_of  :pregunta_4, message: ": puntaje ingresado no es un numero entero"
	
	validates_presence_of :pregunta_5, message: ": por favor complete el espacio en blanco (campo obligatorio)"
	validates_inclusion_of :pregunta_5, in: 0..16, message: ": puntaje ingresado no valido (el rango es de 0 a 16)"
	validates_numericality_of  :pregunta_5, message: ": puntaje ingresado no es un numero entero"

	validates_presence_of :pregunta_6, message: ": por favor complete el espacio en blanco (campo obligatorio)"
	validates_inclusion_of :pregunta_6, in: 0..16, message: ": puntaje ingresado no valido (el rango es de 0 a 16)"
	validates_numericality_of  :pregunta_6, message: ": puntaje ingresado no es un numero entero"
	
	validates_presence_of :pregunta_7, message: ": por favor complete el espacio en blanco (campo obligatorio)"
	validates_inclusion_of :pregunta_7, in: 0..16, message: ": puntaje ingresado no valido (el rango es de 0 a 16)"
	validates_numericality_of  :pregunta_7, message: ": puntaje ingresado no es un numero entero"
	
	validates_presence_of :pregunta_8, message: ": por favor complete el espacio en blanco (campo obligatorio)"
	validates_inclusion_of :pregunta_8, in: 0..16, message: ": puntaje ingresado no valido (el rango es de 0 a 16)"
	validates_numericality_of  :pregunta_8, message: ": puntaje ingresado no es un numero entero"
	
	validates_presence_of :observacion, message: ": por favor complete el espacio en blanco (campo obligatorio)"
	
	validates :fecha_evaluacion, date: true

	validates_presence_of :nota, message: ": por favor complete el espacio en blanco (campo obligatorio)"
	validates_numericality_of :nota, message: ": nota ingresada no es un decimal (decimal con punto)"
 	validates_inclusion_of :nota, in: 1..7, message: ": nota ingresada no valida (es de 1 a 7 y si es decimal es con punto)"
	
	validates_presence_of :nota_informe_practica, message: ": por favor complete el espacio en blanco (campo obligatorio)"
	validates_numericality_of :nota_informe_practica, message: ": nota ingresada no es un decimal (decimal con punto)"
 	validates_inclusion_of :nota_informe_practica, in: 1..7, message: ": nota ingresada no valida (es de 1 a 7 y si es decimal es con punto)"
end