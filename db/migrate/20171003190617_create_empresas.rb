class CreateEmpresas < ActiveRecord::Migration[5.0]
  def change
    create_table :empresas do |t|
      t.string :Nombre
      t.string :Rut

      t.timestamps
    end
  end
end
