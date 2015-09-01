class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name, default: "Customer"

      t.timestamps
    end
    add_index :roles, :name
  end
end
