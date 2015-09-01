# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Role.delete_all
PetType.delete_all
User.delete_all

['dog', 'cat', 'bird'].each do |type|
  PetType.create! name: type
end

['admin', 'doctor', 'receptionist', 'customer'].each do |role|
  Role.create! name: role
end


User.create!([{:name => 'Admin', :email => 'admin@gmail.com', :password => 'admin123', :password_confirmation => 'admin123', :contact_number => "1234567890", :role => Role.where(:name => "admin").first },
	          {:name => 'Bob',   :email => 'bob@gmail.com', :password => 'password', :password_confirmation => 'password', :contact_number => "1234567890", :role => Role.where(:name => "doctor").first},
	          {:name => 'Susan', :email => 'susan@gmail.com', :password => 'password', :password_confirmation => 'password', :contact_number => "1234567890", :role => Role.where(:name => "doctor").first },
	          {:name => 'Receptionist', :email => 'receptionist@gmail.com', :password => 'password', :password_confirmation => 'password', :contact_number => "1234567890", :role => Role.where(:name => "receptionist").first },
	          {:name => 'Customer', :email => 'customer@gmail.com', :password => 'password', :password_confirmation => 'password', :contact_number => "1234567890", :role => Role.where(:name => "customer").first }
	         ])

