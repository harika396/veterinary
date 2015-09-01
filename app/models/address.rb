class Address < ActiveRecord::Base

  belongs_to :user

  validates :street,:city,:state, :presence => true
  validates :zip, :presence => true, length: { is: 5 }
  
end
