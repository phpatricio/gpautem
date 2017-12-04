class Practica < ApplicationRecord

  has_one :alumno
  has_one :profesional_guia
  has_one :convenio
  has_one :empresa
  has_one :seguimiento
  has_one :evaluacion
  has_one :area
  has_one :herramienta

  validates :fecha_inicio, date: true
  validates :fecha_termino, date: true
  validates :fecha_inicio, date: { before: :fecha_termino }
  validates_presence_of :descripcion_p, message: ": por favor complete el espacio en blanco (campo obligatorio)"
end