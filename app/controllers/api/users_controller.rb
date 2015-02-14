class API::UsersController < API::BaseController
  def index
    @users = User.all

    render json: @users
  end
end
