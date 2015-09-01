class Pet < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :pet_type
  
  # validates :name, :age, :breed, :weight, :last_visit, :presence => true
  # validates :name, :breed,  length: { maximum: 35 }
  
end
