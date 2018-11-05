class UsersController < ActionController::API
  def index
    users = User
      .includes(:pet_with_upcoming_appointments)
      .all
      .map do |user|
        {
          user: {
            id: user.id,
            name: "#{user.first_name} #{user.last_name}"
          },
          pets: user.pet_with_upcoming_appointments.map do |pet|
            {
              id: pet.id,
              name: pet.name,
              next_appointment_date: pet.next_appointment_date
            }
          end
        }
      end
    render json: users
  end

  def show
    user = User
      .includes(:pet_with_upcoming_appointments)
      .find(params[:id])

    render json: {
      user: {
        id: user.id,
        name: "#{user.first_name} #{user.last_name}"
      },
      pets: user.pet_with_upcoming_appointments.map do |pet|
        {
          id: pet.id,
          name: pet.name,
          next_appointment_date: pet.next_appointment_date
        }
      end
    }
  end
end
