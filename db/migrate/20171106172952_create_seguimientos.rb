class CreateSeguimientos < ActiveRecord::Migration[5.0]
  def change
    create_table :seguimientos do |t|
      t.date :fecha_1
      t.text :comentario_visita_1
      t.date :fecha_2
      t.text :comentario_visita_2
      t.date :fecha_3
      t.text :comentario_visita_3

      t.timestamps
    end
  end
end
