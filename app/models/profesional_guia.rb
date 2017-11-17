class ProfesionalGuia < ApplicationRecord
	has_one :practica
	validates :rut, presence: true

 	validates :Nombre, presence: true
 	validates :Cargo, presence: true
 	validates :Email, presence: true
 	validates :Email, uniqueness: true
 	
 	validates :Direccion, presence: true
 	validates :Telefono, presence: true
 	validates :Telefono, numericality: true
 	validates :Telefono, length: {is: 9}
 	validates :Telefono, uniqueness: true
end