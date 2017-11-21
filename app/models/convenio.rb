class Convenio < ApplicationRecord
	has_many :practica
	has_one :empresa
end
