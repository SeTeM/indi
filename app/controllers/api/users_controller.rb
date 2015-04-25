class API::UsersController < API::BaseController
  def index
    load_users
    render_users
  end

  private

  def load_users
    @users = UsersCollection.new.items
  end

  def render_users
    render json: @users
  end
end
