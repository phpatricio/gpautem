class Herramienta < ApplicationRecord
	self.table_name = "herramientas"
	has_one :practica
end
