class Weight < ActiveRecord::Base
  belongs_to :user
  validates :date,:weight,presence:true
  
end
