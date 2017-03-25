class Temperature < ActiveRecord::Base
  belongs_to :user
  validates :date,:temperature, presence: true
end
