class Convenio < ApplicationRecord
	validates :name, presence: true
    validates :descripcion, presence: true
end
