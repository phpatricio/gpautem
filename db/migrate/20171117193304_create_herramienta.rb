class CreateHerramienta < ActiveRecord::Migration[5.0]
  def change
    create_table :herramientas do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
