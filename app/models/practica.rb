class Practica < ApplicationRecord
  has_one :profesional_guia
  validates :descripcion_p, presence: true
  validates :fecha_inicio, date: true
  validates :fecha_termino, date: true
  validates :fecha_inicio, date: { before: :fecha_termino }

end
