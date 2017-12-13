class Practica < ApplicationRecord

  has_one :alumno
  has_one :profesional_guia
  has_one :convenio
  has_one :empresa
  has_one :seguimiento
  has_one :evaluacion
  has_one :area
  has_one :herramienta
  validate :fecha_correcta
  #validates :fecha_inicio, date: true
  #validates :fecha_termino, date: true
  #validates :fecha_inicio, date: { before: :fecha_termino }
  def fecha_correcta

    if !fecha_inicio.blank? and  fecha_inicio < Date.today
      errors.add(:fecha_inicio, "Ingresaste una fecha que ya paso")
    end
    if fecha_termino < fecha_inicio
      errors.add(:fecha_termino, "La fecha de termino no puede ser inferior a la fecha de inicio")
    end
    if fecha_termino < fecha_inicio + 2.month or fecha_termino > fecha_inicio+ 3.month
      errors.add(:fecha_termino, "Practica debe superar los 2 meses y debe ser inferior a 3 meses")
    end
    
 end
  validates_presence_of :descripcion_p, message: ": por favor complete el espacio en blanco (campo obligatorio)"
end