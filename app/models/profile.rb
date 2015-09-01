class Profile < ActiveRecord::Base
  
  validates :years_practice, :inclusion => 1..100
end
