class Pet < ActiveRecord::Base
  belongs_to :user
  has_many :appointments
  accepts_nested_attributes_for :appointments
end
