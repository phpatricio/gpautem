class ProfesionalGuia < ApplicationRecord
	has_one :practica
	validates_presence_of :rut, message: ": por favor complete el espacio en blanco (campo obligatorio)"
	validates :rut, rut: true
	validates_uniqueness_of :rut, message: ": el rut ingresado ya esta en el sistema"

 	validates_presence_of :Nombre, message: ": por favor complete el espacio en blanco (campo obligatorio)"
 	
 	validates_presence_of :Cargo, message: ": por favor complete el espacio en blanco (campo obligatorio)"
 	
 	validates_presence_of :Email, message:": por favor complete el espacio en blanco (campo obligatorio)"
 	validates_uniqueness_of :Email, message: ": email ingresado ya existe"
 	
 	validates_presence_of :Direccion, message: ": por favor complete el espacio en blanco (campo obligatorio)"
 	
 	validates :Telefono, presence: true
 	validates_numericality_of :Telefono, message: ": telefono ingresado no valido (deve de tener nueve digitos)"
 	validates :Telefono, length: { is: 9 , message:"verifique que el numero tenga 9 digitos" }
 	validates_uniqueness_of :Telefono, message: ": telefono ingresado ya existe"

end