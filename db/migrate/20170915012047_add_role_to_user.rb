class AddRoleToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :rols, foreign_key: true
  end
end
