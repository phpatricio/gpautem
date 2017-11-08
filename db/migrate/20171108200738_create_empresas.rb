class CreateEmpresas < ActiveRecord::Migration[5.0]
  def change
    create_table :empresas do |t|
      t.string :rut_empresa
      t.string :nombre_empresa

      t.timestamps
    end
  end
end
