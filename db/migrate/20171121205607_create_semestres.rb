class CreateSemestres < ActiveRecord::Migration[5.0]
  def change
    create_table :semestres do |t|
      t.integer :numero_semestre

      t.timestamps
    end
  end
end
