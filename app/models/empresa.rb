class Empresa < ApplicationRecord
	validates :rut_empresa, presence: true
	validates :rut_empresa, rut: true
    validates :nombre_empresa, presence: true
end
