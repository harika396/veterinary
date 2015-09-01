class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.datetime :date_of_visit
      t.integer :pet_id
      t.integer :user_id
      t.datetime :reminder
      t.text :reason
      t.integer :doctor_id

      t.timestamps
    end
    add_index :appointments, :pet_id
    add_index :appointments, :user_id
    add_index :appointments, :doctor_id
  end
end
