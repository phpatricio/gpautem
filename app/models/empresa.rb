class Empresa < ApplicationRecord
	validates :rut_empresa, presence: true
	
    validates :nombre_empresa, presence: true
end
