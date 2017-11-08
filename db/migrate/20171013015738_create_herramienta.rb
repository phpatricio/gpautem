class CreateHerramienta < ActiveRecord::Migration[5.0]
  def change
    create_table :herramienta do |t|

      t.timestamps
    end
  end
end
