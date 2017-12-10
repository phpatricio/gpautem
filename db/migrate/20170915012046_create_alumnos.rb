class CreateAlumnos < ActiveRecord::Migration[5.0]
  def change
    create_table :alumnos do |t|
      t.string :nombre
      t.string :apellido
      t.string :email
      t.string :rut
      t.integer :codigo_carrera
      t.integer :semestre
      t.integer :ano
      t.references :user
      t.timestamps
    end
  end
end
