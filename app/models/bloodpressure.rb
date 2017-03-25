class Bloodpressure < ActiveRecord::Base
  belongs_to :user
  validates :date,:systolic,:dystolic,presence:true
end