class Practica < ApplicationRecord
  has_one :profesional_guia
  validates :descripcion_p, presence: true
end
