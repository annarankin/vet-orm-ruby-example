class CreatePetsWithUpcomingAppointments < ActiveRecord::Migration[4.2]
  def change
    create_view :pets_with_upcoming_appointments
  end
end
