class CreateRols < ActiveRecord::Migration[5.0]
  def change
    create_table :rols do |t|
      t.string :nombre
      t.string :descripcion

      t.timestamps
    end
  end
end
