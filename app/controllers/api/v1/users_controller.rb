class Api::V1::UsersController < ApiController

  private

  def resource_name
    "User"
  end

  def obj_params
    params.require(:resource).permit(*%i(
      first_name
      last_name
      email
      password
    ))
  end
end
