class Api::V1::SessionsController < ApiController

  def create
    @user = User.find_by_credentials(params[:resource])
    if @user.present? && @user.set_access_token
      render json: { user: @user, access_token: @user.current_token }
    else
      fail InvalidCredentialsError
    end
  end

  private

  def resource_name
    "Session"
  end
end
