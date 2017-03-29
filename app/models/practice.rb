class Practice < ActiveRecord::Base
  belongs_to :user
  has_many :photos
  has_many :appointments
  has_many :reviews
  
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  
  validates :dr_first_name, presence: true
  validates :dr_last_name,  presence: true
  validates :experience,    presence: true
  validates :speciality,    presence: true
  validates :address,       presence: true 
  validates :professional_statement,presence: true
  validates :is_insurance,  presence: true 

 def average_rating
    reviews.count == 0 ? 0 : reviews.average(:star).round(2)
 end

  def self.search(search)
    where("speciality like ? OR zip_code like ?", "%#{search}%", "%#{search}%")
  end
end