class CreateEvaluacions < ActiveRecord::Migration[5.0]
  def change
    create_table :evaluacions do |t|
      t.integer :pregunta_1
      t.integer :pregunta_2
      t.integer :pregunta_3
      t.integer :pregunta_4
      t.integer :pregunta_5
      t.integer :pregunta_6
      t.integer :pregunta_7
      t.integer :pregunta_8
      t.text :observacion
      t.date :fecha_evaluacion
      t.float :nota
      t.float :nota_informe_practica
      t.timestamps
    end
  end
end
