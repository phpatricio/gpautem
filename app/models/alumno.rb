class Alumno < ApplicationRecord

	has_one :practica

	validates_presence_of :nombre, message: ": por favor complete el espacio en blanco (campo obligatorio)"
	validates_presence_of :apellido, message: ": por favor complete el espacio en blanco (campo obligatorio)"
	validate :uniqueness_of_rut, on: :create
	validates_presence_of :rut, message: ": por favor complete el espacio en blanco (campo obligatorio)"

	def uniqueness_of_rut
	   existing_record = Alumno.find_by_rut(rut)
	   unless existing_record.nil?
	     errors.add(:rut, "El rut ingresado ya esta registrado en la base de datos")
	   end

	end



end
