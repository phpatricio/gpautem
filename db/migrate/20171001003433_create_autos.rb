class CreateAutos < ActiveRecord::Migration[5.0]
  def change
    create_table :autos do |t|
      t.string :nombre
      t.string :modelo
      t.integer :cantidad_ruedas
      t.text :descripcion

      t.timestamps
    end
  end
end
