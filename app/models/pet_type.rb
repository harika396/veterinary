class PetType < ActiveRecord::Base
  
  has_many :pets

  def self.pet_types
      all.collect {|pet|   [pet.name, pet.id]  }.compact
  end
end
