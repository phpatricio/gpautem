class Herramienta < ApplicationRecord
	self.table_name = "herramientas"
	has_one :practica
	validates_presence_of :nombre, message: ": por favor complete el espacio en blanco (campo obligatorio)"
end