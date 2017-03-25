class Bloodsugar < ActiveRecord::Base
  belongs_to :user
  validates :date,:fasting,:nonfasting,presence:true
end