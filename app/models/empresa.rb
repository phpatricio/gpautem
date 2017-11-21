class Empresa < ApplicationRecord
	has_many :practica
	has_many :conveio
	validates :rut_empresa, presence: true
	validates :rut_empresa, rut: true
    validates :nombre_empresa, presence: true
end
