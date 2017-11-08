class CreateEvaluacions < ActiveRecord::Migration[5.0]
  def change
    create_table :evaluacions do |t|
      t.string :pregunta_1

      t.timestamps
    end
  end
end
