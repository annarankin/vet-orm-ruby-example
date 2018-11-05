class UsersController < ActionController::API
  def show
    user = User
      .includes(:pets)
      .find(params[:id])

    upcoming_appointments = user
      .appointments
      .where(
        'pet_id IN (?) AND date >= ?',
        user.pets.pluck(:id),
        Time.current
      )
      .order(date: :asc)

    render json: {
      user: {
        id: user.id,
        name: "#{user.first_name} #{user.last_name}"
      },
      pets: user.pets.map do |pet|
        next_appointment_date = user
          .appointments
          .order(date: :asc)
          .find_by('date >= ?', Time.current)
          &.date

        {
          id: pet.id,
          name: pet.name,
          next_appointment_date: next_appointment_date
        }
      end
    }
  end
end
