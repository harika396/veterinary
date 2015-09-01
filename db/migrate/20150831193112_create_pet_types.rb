class CreatePetTypes < ActiveRecord::Migration
  def change
    create_table :pet_types do |t|
      t.string :name

      t.timestamps
    end
    add_index :pet_types, :name
  end
end
