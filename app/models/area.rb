class Area < ApplicationRecord
	has_many :practica
	validates_presence_of :nombre, message: ": por favor complete el espacio en blanco (campo obligatorio)"
end