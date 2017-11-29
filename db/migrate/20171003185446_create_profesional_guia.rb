class CreateProfesionalGuia < ActiveRecord::Migration[5.0]
  def change
    create_table :profesional_guia do |t|
      t.string :rut
      t.string :Nombre
      t.string :Cargo
      t.string :Email
      t.string :Direccion
      t.string :Telefono

      t.timestamps
    end
  end
end
