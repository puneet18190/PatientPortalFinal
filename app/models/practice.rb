class Practice < ActiveRecord::Base
  belongs_to :user
  has_many :photos
  has_many :appointments
  
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  
  validates :dr_first_name, presence: true
  validates :dr_last_name,  presence: true
  validates :experience,    presence: true
  validates :speciality,    presence: true
  validates :address,       presence: true 
  validates :professional_statement,presence: true
  validates :is_insurance,  presence: true 
end
