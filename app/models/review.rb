class Review < ActiveRecord::Base
  belongs_to :practice
  belongs_to :user
end
