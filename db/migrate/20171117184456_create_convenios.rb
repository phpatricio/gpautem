class CreateConvenios < ActiveRecord::Migration[5.0]
  def change
    create_table :convenios do |t|
      t.string :nombre
      t.date :fecha_inicio
      t.date :fecha_termino
      t.text :descripcion
      t.references :empresa

      t.timestamps
    end
  end
end
