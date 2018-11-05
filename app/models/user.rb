class User < ActiveRecord::Base
  has_many :pets
  has_many :pet_with_upcoming_appointments
  has_many :appointments, through: :pets
  accepts_nested_attributes_for :pets, :appointments
end
