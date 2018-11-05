class Appointment < ActiveRecord::Base
  belongs_to :pet
  has_one :user, through: :pet
end
