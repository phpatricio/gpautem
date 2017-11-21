class CreatePracticas < ActiveRecord::Migration[5.0]
  def change
    create_table :practicas do |t|
      t.date :fecha_inicio
      t.date :fecha_termino
      t.text :descripcion_p
      t.references :alumno, foreign_key: true
      t.references :profesional_guia
      t.references :herramienta
      t.references :convenio
      t.references :empresa
      t.references :seguimiento
      t.references :evaluacion
      t.references :area
      

      t.timestamps
    end
  end
end
