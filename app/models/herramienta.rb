class Herramienta < ApplicationRecord
	self.table_name = "herramientas"
	has_one :practica
	validates_presence_of :nombre, message: ": por favor complete el espacio en blanco (campo obligatorio)"
	validates :nombre, length: { in: 1..20 , message:"Ingrese el nombre de la herramienta entre 1 y 20 caracteres" }
end