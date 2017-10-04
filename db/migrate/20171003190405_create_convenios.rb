class CreateConvenios < ActiveRecord::Migration[5.0]
  def change
    create_table :convenios do |t|
      t.string :Descripcion

      t.timestamps
    end
  end
end
