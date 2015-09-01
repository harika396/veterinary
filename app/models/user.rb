class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :doctors, -> { where( role: Role.doctor_role ) }
  ROLES = ['admin', 'doctor', 'receptionist', 'customer']
  
  before_create :set_role
  
  belongs_to :role
  has_one :address
  has_one :profile
  has_many :appointments, :dependent => :destroy
  has_one :pet
  
  accepts_nested_attributes_for :profile, :allow_destroy => true
  accepts_nested_attributes_for :address, :allow_destroy => true
  accepts_nested_attributes_for :pet, :allow_destroy => true
  
  validates :name, :presence => true, length: { maximum: 35 }
  # validates :email, :presence => true
  
  ROLES.each do |role|
    define_method "#{role}?" do
      self.role.name == role
    end
  end

  # def admin?
  #   self.role.name == "admin"
  # end
  
  def self.doctors
      all.collect {|doctor|   [doctor.name, doctor.id] if  doctor.role.name == "doctor" }.compact
  end
  
  def self.customers
      all.collect {|customer|   [customer.name, customer.id] if  customer.role.name == "customer" }.compact
  end
  
  private
  
  def set_role
    self.role ||=Role.find_by_name('customer')
  end
  
end
