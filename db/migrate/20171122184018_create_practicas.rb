class CreatePracticas < ActiveRecord::Migration[5.0]
  def change
    create_table :practicas do |t|
      t.date :fecha_inicio
      t.date :fecha_termino
      t.text :descripcion_p
      t.references :alumno, foreign_key: true
      t.references :profesional_guia, foreign_key: true
      t.references :herramienta
      t.references :convenio, foreign_key: true
      t.references :empresa, foreign_key: true
      t.references :seguimiento, foreign_key: true
      t.references :evaluacion, foreign_key: true
      t.references :area, foreign_key: true
      

      t.timestamps
    end
  end
end
