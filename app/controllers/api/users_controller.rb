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

  def build_updating_service
    @service = User::UpdatingService.new(current_user, user_params)
  end

  def user_params
    if params[:user]
      user_params = params.require(:user).permit(:about, :hired_at)
      user_params.merge(tags: tags)
    else
      {}
    end
  end

  def tags
    Tag.where(title: params[:user][:tags])
  end
end
