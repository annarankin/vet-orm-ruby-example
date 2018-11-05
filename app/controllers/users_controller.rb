class UsersController < ActionController::API
  def show
    user = User.includes(:pets).find(params[:id])

    render json: {
      user: {
        id: user.id,
        name: "#{user.first_name} #{user.last_name}"
      },
      pets: user.pets.map do |pet|
        {
          id: pet.id,
          name: pet.name
        }
      end
    }
  end
end
