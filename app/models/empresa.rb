class Empresa < ApplicationRecord
	has_many :practica
	has_many :conveio
	validates_presence_of :rut, message: "por favor complete el espacio en blanco (campo obligatorio)"
	validates :rut_empresa, rut: true
	validates_uniqueness_of :rut, message: "el rut ungresado ya esta en el sistema"
    validates_presence_of :nombre, message: "por favor complete el espacio en blanco (campo obligatorio)"
end
