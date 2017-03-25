class Heartbeat < ActiveRecord::Base
  belongs_to :user
  validates :date,:count,presence:true
end
