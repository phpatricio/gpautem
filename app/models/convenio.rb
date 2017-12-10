class Convenio < ApplicationRecord
	has_many :practica
	has_one :empresa
	validates_presence_of :nombre, message: ": por favor complete el espacio en blanco (campo obligatorio)"
	validates_presence_of :descripcion, message: ": por favor complete el espacio en blanco (campo obligatorio)"
  	validates :fecha_inicio, date: { before: :fecha_termino }
end