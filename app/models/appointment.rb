class Appointment < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :doctor, foreign_key: "doctor_id", class_name: "User"
  belongs_to :pet
  
  accepts_nested_attributes_for :user, :allow_destroy => true
  accepts_nested_attributes_for :pet, :allow_destroy => true

  validates :date_of_visit, :reminder, :reason, :presence => true
  
end
