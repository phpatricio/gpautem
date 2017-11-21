class CreateCodigos < ActiveRecord::Migration[5.0]
  def change
    create_table :codigos do |t|
      t.integer :codigo_carrera

      t.timestamps
    end
  end
end
