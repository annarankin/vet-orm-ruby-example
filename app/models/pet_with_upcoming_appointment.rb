class PetWithUpcomingAppointment < ActiveRecord::Base
  self.table_name = 'pets_with_upcoming_appointments'
  belongs_to :user
end
